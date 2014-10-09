# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-client/firefox/firefox-24.5.0.ebuild,v 1.6 2014/05/11 08:09:49 ago Exp $

EAPI=5
VIRTUALX_REQUIRED="pgo"
WANT_AUTOCONF="2.1"

MOZ_LANGS=(af ak ar ast be bg bn-BD bn-IN br bs ca cs cy da de
el en-GB en-ZA eo es-AR es-CL es-ES es-MX et eu fa fi fr
fy-NL ga-IE gd gl gu-IN he hi-IN hr hu id is it ja kk kn ko ku
lg lt lv mai mk ml mr nb-NO nl nn-NO nso or pa-IN pl pt-BR pt-PT rm ro
ru si sk sl son sq sr sv-SE ta ta-LK te th tr uk vi zh-CN zh-TW zu )

MOZ_LANGPACK_PREFIX="langpacks/24.x/"

# Upstream release URI that's used by mozlinguas.eclass
MOZ_FTP_URI="http://relmirror.palemoon.org"

inherit check-reqs flag-o-matic toolchain-funcs eutils gnome2-utils mozconfig-3 multilib pax-utils fdo-mime autotools virtualx mozlinguas

DESCRIPTION="Pale Moon Web Browser"
HOMEPAGE="http://www.palemoon.org"

KEYWORDS="~amd64"
SLOT="0"
LICENSE="MPL-2.0 GPL-2 LGPL-2.1"
IUSE="bindist gstreamer +jit +minimal pgo pulseaudio selinux system-cairo system-icu system-jpeg system-sqlite test"

SRC_URI="${SRC_URI} ftp://source:get@ftp.palemoon.org/${P}-source.7z"

ASM_DEPEND=">=dev-lang/yasm-1.1"

# Mesa 7.10 needed for WebGL + bugfixes
RDEPEND="
	>=dev-libs/nss-3.16
	>=dev-libs/nspr-4.10.4
	>=dev-libs/glib-2.26:2
	>=media-libs/mesa-7.10
	>=media-libs/libpng-1.5.13[apng]
	virtual/libffi
	gstreamer? ( media-plugins/gst-plugins-meta:0.10[ffmpeg] )
	pulseaudio? ( media-sound/pulseaudio )
	system-cairo? ( >=x11-libs/cairo-1.12[X] )
	system-icu? ( >=dev-libs/icu-51.1 )
	system-jpeg? ( >=media-libs/libjpeg-turbo-1.2.1 )
	system-sqlite? ( >=dev-db/sqlite-3.7.17:3[secure-delete,debug=] )
	>=media-libs/libvpx-1.0.0
	kernel_linux? ( media-libs/alsa-lib )
	selinux? ( sec-policy/selinux-mozilla )"

DEPEND="${RDEPEND}
	>=sys-devel/binutils-2.16.1
	virtual/pkgconfig
	pgo? (
		>=sys-devel/gcc-4.5 )
	amd64? ( ${ASM_DEPEND}
		virtual/opengl )
	x86? ( ${ASM_DEPEND}
		virtual/opengl )"

QA_PRESTRIPPED="usr/$(get_libdir)/${P}/palemoon"

pkg_setup() {
	moz_pkgsetup

	# Avoid PGO profiling problems due to enviroment leakage
	# These should *always* be cleaned up anyway
	unset DBUS_SESSION_BUS_ADDRESS \
		DISPLAY \
		ORBIT_SOCKETDIR \
		SESSION_MANAGER \
		XDG_SESSION_COOKIE \
		XAUTHORITY

	if ! use bindist; then
		einfo
		elog "You are enabling official branding. You may not redistribute this build"
		elog "to any users on your network or the internet. Doing so puts yourself into"
		elog "a legal problem with Mozilla Foundation"
		elog "You can disable it by emerging ${PN} _with_ the bindist USE-flag"
	fi

	if use pgo; then
		einfo
		ewarn "You will do a double build for profile guided optimization."
		ewarn "This will result in your build taking at least twice as long as before."
		ewarn "Be aware that Upstream warns against using a pgo enabled build."
	fi
}

pkg_pretend() {
	# Ensure we have enough disk space to compile
	if use pgo || use debug || use test ; then
		CHECKREQS_DISK_BUILD="8G"
	else
		CHECKREQS_DISK_BUILD="4G"
	fi
	check-reqs_pkg_setup
}

src_unpack() {
	mkdir -p "${S}"
	cd "${S}"
	unpack ${A}

	#HACK :-(
	chmod -R 777 .

	cd "${WORKDIR}"

	# Unpack language packs
	mozlinguas_src_unpack
}

src_prepare() {
	# Allow user to apply any additional patches without modifing ebuild
	epatch_user

	# Enable gnomebreakpad
	if use debug ; then
		sed -i -e "s:GNOME_DISABLE_CRASH_DIALOG=1:GNOME_DISABLE_CRASH_DIALOG=0:g" \
			"${S}"/build/unix/run-mozilla.sh || die "sed failed!"
	fi

	# Ensure that our plugins dir is enabled as default
	sed -i -e "s:/usr/lib/mozilla/plugins:/usr/lib/nsbrowser/plugins:" \
		"${S}"/xpcom/io/nsAppFileLocationProvider.cpp || die "sed failed to replace plugin path for 32bit!"
	sed -i -e "s:/usr/lib64/mozilla/plugins:/usr/lib64/nsbrowser/plugins:" \
		"${S}"/xpcom/io/nsAppFileLocationProvider.cpp || die "sed failed to replace plugin path for 64bit!"

	# Fix sandbox violations during make clean, bug 372817
	sed -e "s:\(/no-such-file\):${T}\1:g" \
		-i "${S}"/config/rules.mk \
		-i "${S}"/js/src/config/rules.mk \
		-i "${S}"/nsprpub/configure{.in,} \
		|| die

	# Don't exit with error when some libs are missing which we have in
	# system.
	sed '/^MOZ_PKG_FATAL_WARNINGS/s@= 1@= 0@' \
		-i "${S}"/browser/installer/Makefile.in || die

	# Don't error out when there's no files to be removed:
	sed 's@\(xargs rm\)$@\1 -f@' \
		-i "${S}"/toolkit/mozapps/installer/packager.mk || die

	eautoreconf

	# Must run autoconf in js/src
	cd "${S}"/js/src || die
	eautoconf
}

src_configure() {
	MOZILLA_FIVE_HOME="/usr/$(get_libdir)/${P}"
	MEXTENSIONS="default"

	####################################
	#
	# mozconfig, CFLAGS and CXXFLAGS setup
	#
	####################################

	cp browser/config/mozconfig .mozconfig \
		|| die "cp browser/config/mozconfig failed"

	mozconfig_init
	mozconfig_config

	# We must force enable jemalloc 3 through .mozconfig
	echo "export MOZ_JEMALLOC=1" >> ${S}/.mozconfig

	mozconfig_annotate '' --enable-jemalloc
	mozconfig_annotate '' --enable-replace-malloc
	mozconfig_annotate '' --prefix="${EPREFIX}"/usr
	mozconfig_annotate '' --libdir="${EPREFIX}"/usr/$(get_libdir)
	mozconfig_annotate '' --enable-extensions="${MEXTENSIONS}"
	mozconfig_annotate '' --disable-gconf
	mozconfig_annotate '' --disable-mailnews
	mozconfig_annotate '' --with-system-png
	mozconfig_annotate '' --enable-system-ffi
	mozconfig_annotate '' --disable-accessibility
	mozconfig_annotate '' --disable-parental-controls
	mozconfig_annotate '' --disable-webrtc
	mozconfig_annotate '' --disable-logging
	mozconfig_annotate '' --disable-websms-backend

	# Other ff-specific settings
	mozconfig_annotate '' --with-default-mozilla-five-home=${MOZILLA_FIVE_HOME}
	mozconfig_annotate '' --target="${CTARGET:-${CHOST}}"
	mozconfig_annotate '' --build="${CTARGET:-${CHOST}}"

	mozconfig_use_enable gstreamer
	mozconfig_use_enable pulseaudio
	mozconfig_use_enable system-cairo
	mozconfig_use_enable system-sqlite
	mozconfig_use_with system-jpeg
	mozconfig_use_with system-icu
	mozconfig_use_enable system-icu intl-api
	# Feature is know to cause problems on hardened
	mozconfig_use_enable jit ion

	# Allow for a proper pgo build
	if use pgo; then
		echo "mk_add_options PROFILE_GEN_SCRIPT='\$(PYTHON) \$(OBJDIR)/_profile/pgo/profileserver.py'" >> "${S}"/.mozconfig
	fi

	# Finalize and report settings
	mozconfig_final

	if [[ $(gcc-major-version) -lt 4 ]]; then
		append-cxxflags -fno-stack-protector
	elif [[ $(gcc-major-version) -gt 4 || $(gcc-minor-version) -gt 3 ]]; then
		if use amd64 || use x86; then
			append-flags -mno-avx
		fi
	fi
}

src_compile() {
	if use pgo; then
		addpredict /root
		addpredict /etc/gconf
		# Reset and cleanup environment variables used by GNOME/XDG
		gnome2_environment_reset

		# Firefox tries to use dri stuff when it's run, see bug 380283
		shopt -s nullglob
		cards=$(echo -n /dev/dri/card* | sed 's/ /:/g')
		if test -z "${cards}"; then
			cards=$(echo -n /dev/ati/card* /dev/nvidiactl* | sed 's/ /:/g')
			if test -n "${cards}"; then
				# Binary drivers seem to cause access violations anyway, so
				# let's use indirect rendering so that the device files aren't
				# touched at all. See bug 394715.
				export LIBGL_ALWAYS_INDIRECT=1
			fi
		fi
		shopt -u nullglob
		addpredict "${cards}"

		CC="$(tc-getCC)" CXX="$(tc-getCXX)" LD="$(tc-getLD)" \
		MOZ_MAKE_FLAGS="${MAKEOPTS}" SHELL="${SHELL}" \
		Xemake -f client.mk profiledbuild || die "Xemake failed"
	else
		CC="$(tc-getCC)" CXX="$(tc-getCXX)" LD="$(tc-getLD)" \
		MOZ_MAKE_FLAGS="${MAKEOPTS}" SHELL="${SHELL}" \
		emake -f client.mk
	fi

}

src_install() {
	MOZILLA_FIVE_HOME="/usr/$(get_libdir)/${P}"
	DICTPATH="\"${EPREFIX}/usr/share/myspell\""

	# MOZ_BUILD_ROOT, and hence OBJ_DIR change depending on arch, compiler, pgo, etc.
	local obj_dir="$(echo */config.log)"
	obj_dir="${obj_dir%/*}"
	cd "${S}/${obj_dir}" || die

	# Pax mark xpcshell for hardened support, only used for startupcache creation.
	pax-mark m "${S}/${obj_dir}"/dist/bin/xpcshell

	# Add our default prefs for firefox
	cp "${FILESDIR}"/gentoo-default-prefs.js-1 \
		"${S}/${obj_dir}/dist/bin/browser/defaults/preferences/all-gentoo.js" \
		|| die

	# Set default path to search for dictionaries.
	echo "pref(\"spellchecker.dictionary_path\", ${DICTPATH});" \
		>> "${S}/${obj_dir}/dist/bin/browser/defaults/preferences/all-gentoo.js" \
		|| die

	if ! use libnotify; then
		echo "pref(\"browser.download.manager.showAlertOnComplete\", false);" \
			>> "${S}/${obj_dir}/dist/bin/browser/defaults/preferences/all-gentoo.js" \
			|| die
	fi

	echo "pref(\"extensions.autoDisableScopes\", 3);" >> \
		"${S}/${obj_dir}/dist/bin/browser/defaults/preferences/all-gentoo.js" \
		|| die

	MOZ_MAKE_FLAGS="${MAKEOPTS}" \
	emake DESTDIR="${D}" install

	# Install language packs
	mozlinguas_src_install

	local size sizes icon_path icon name
	if use bindist; then
		sizes="16 32 48"
		icon_path="${S}/browser/branding/aurora"
		# Firefox's new rapid release cycle means no more codenames
		# Let's just stick with this one...
		icon="aurora"
		name="Aurora - Pale Moon"
	else
		sizes="16 22 24 32 256"
		icon_path="${S}/browser/branding/official"
		icon="${PN}"
		name="Pale Moon"
	fi

	# Install icons and .desktop for menu entry
	for size in ${sizes}; do
		insinto "/usr/share/icons/hicolor/${size}x${size}/apps"
		newins "${icon_path}/default${size}.png" "${icon}.png"
	done
	# The 128x128 icon has a different name
	insinto "/usr/share/icons/hicolor/128x128/apps"
	newins "${icon_path}/mozicon128.png" "${icon}.png"
	# Install a 48x48 icon into /usr/share/pixmaps for legacy DEs
	newicon "${icon_path}/content/icon48.png" "${icon}.png"
	newmenu "${FILESDIR}/icon/${PN}.desktop" "${PN}.desktop"
	sed -i -e "s:@NAME@:${name}:" -e "s:@ICON@:${icon}:" \
		"${ED}/usr/share/applications/${PN}.desktop" || die

	# Add StartupNotify=true bug 237317
	if use startup-notification ; then
		echo "StartupNotify=true" \
			>> "${ED}/usr/share/applications/${PN}.desktop" \
			|| die
	fi

	# Required in order to use plugins and even run firefox on hardened.
	pax-mark m "${ED}"${MOZILLA_FIVE_HOME}/{palemoon,palemoon-bin,plugin-container}

	if use minimal; then
		rm -r "${ED}"/usr/include "${ED}/usr/$(get_libdir)/${PN}-devel-${PV}" \
			|| die "Failed to remove sdk and headers"
	fi
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	# Update mimedb for the new .desktop file
	fdo-mime_desktop_database_update
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}

mozversion_is_new_enough() {
	return 0
}
