# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

E_PKG_IUSE="doc nls"

EFL_USE_GIT="yes"
EFL_GIT_REPO_CATEGORY="core"
EGIT_COMMIT="v${PV}"

inherit efl

DESCRIPTION="Enlightenment Foundation Libraries all-in-one package"
HOMEPAGE="http://trac.enlightenment.org/e/wiki/EFL"

KEYWORDS="~amd64 ~x86"

IUSE="gnutls openssl glib
	wayland fbcon sdl egl -pixman
	gif webp tiff
	+gstreamer xine v4l2
	+fribidi +fontconfig harfbuzz
	+curl +tslib
	audio pulseaudio +multisense
	+physics
	systemd
	X -xcb gles opengl
	+xim +scim ibus
	debug
"

# TODO: pixman with a bunch of options

REQUIRED_USE="
	openssl?	( !gnutls					)
	X?			( !xcb						)
	opengl?		( !gles						)

	pulseaudio?	( audio						)
	multisense?	( pulseaudio					)

	opengl?		( || ( X xcb sdl wayland )	)
	gles?		( || ( X xcb sdl wayland )	)

	gles?		( egl						)
	xcb?		( pixman					)
	sdl?		( || ( opengl gles )		)
	wayland?	( egl || ( opengl gles )	)

	xim?		( || ( X xcb )				)
"

RDEPEND="
	gnutls? ( net-libs/gnutls )
	openssl? ( dev-libs/openssl )
	media-libs/libsdl2
	glib? ( dev-libs/glib )

	wayland? ( >=dev-libs/wayland-1.2.0 >=x11-libs/libxkbcommon-0.3.1 )

	fontconfig? ( media-libs/fontconfig )

	fribidi? ( dev-libs/fribidi )

	harfbuzz? ( media-libs/harfbuzz )

	pixman? ( x11-libs/pixman )

	audio? ( media-libs/libsndfile )
	pulseaudio? ( media-sound/pulseaudio )

	physics? ( sci-physics/bullet )

	systemd? ( sys-apps/systemd )

	>=sys-apps/util-linux-2.20.0
	virtual/jpeg
	sys-libs/zlib
	sys-apps/dbus
	dev-lang/luajit:2

	media-libs/libpng
	gif? ( media-libs/giflib )
	tiff? ( media-libs/tiff )
	tslib? ( x11-libs/tslib )
	webp? ( media-libs/libwebp )

	xine? ( >=media-libs/xine-lib-1.1.1 )
	gstreamer? (
		media-libs/gstreamer:1.0
		media-libs/gst-plugins-good:1.0
		)

	X? (
		x11-libs/libXcursor
		x11-libs/libX11
		x11-libs/libXcomposite
		x11-libs/libXdamage
		x11-libs/libXext
		x11-libs/libXfixes
		x11-libs/libXinerama
		x11-libs/libXp
		x11-libs/libXrandr
		x11-libs/libXrender
		x11-libs/libXtst
		x11-libs/libXScrnSaver

		opengl? (
			x11-libs/libX11
			x11-libs/libXrender
			virtual/opengl
		)

		gles? (
			x11-libs/libX11
			x11-libs/libXrender
			virtual/opengl
		)
	)

	xcb? (
		x11-libs/libxcb

		opengl? (
			x11-libs/libX11
			x11-libs/libXrender
			virtual/opengl
			x11-libs/xcb-util-renderutil
		)

		gles? (
			x11-libs/libX11
			x11-libs/libXrender
			virtual/opengl
			x11-libs/xcb-util-renderutil
		)
	)

	sdl? (
		media-libs/libsdl

		virtual/opengl
	)

	scim?	( app-i18n/scim )
	ibus?	( app-i18n/ibus )

	debug? ( dev-util/valgrind )
"

CORE_EFL_CONFLICTS="
	!dev-libs/ecore
	!dev-libs/edbus
	!dev-libs/eet
	!dev-libs/eeze
	!dev-libs/efreet
	!dev-libs/eina
	!dev-libs/eio
	!dev-libs/embryo
	!dev-libs/eobj
	!dev-libs/ephysics
	!media-libs/edje
	!media-libs/emotion
	!media-libs/ethumb
	!media-libs/evas
"

DEPEND="
	${CORE_EFL_CONFLICTS}

	doc? ( app-doc/doxygen )

	${RDEPEND}
"

pkg_pretend() {
	local conflicts=""

	for i in ${CORE_EFL_CONFLICTS}; do
		has_version ${i#\!} && conflicts+=" ${i#\!}"
	done

	test -z "${conflicts}" && return

	eerror "Portage is unable to automatically resolve conflict with EFL"
	eerror "libraries merged into dev-libs/efl, so please remove them manually"
	eerror
	eerror "emerge -C ${conflicts}"
	eerror

	die "Run emerge  -C ${conflicts}"
}

src_configure() {
	local profile="release"

	use debug && profile="debug"

	local crypto="none"

	use openssl && crypto="openssl"
	use gnutls && crypto="gnutls"

	local x11="none"
	local enable_graphics=""

	use X && x11="xlib"
	use xcb && x11="xcb"

	( use X || use xcb ) && enable_graphics="--with-x"

	local opengl="none"

	use opengl && opengl="full"
	use gles && opengl="es"

	local glib="no"

	use glib && glib="yes"

	export MY_ECONF="
	  ${MY_ECONF}
	  --with-profile=${profile}
	  $(use_enable nls)
	  $(use_enable doc)

	  $(use_enable wayland)
	  $(use_enable fbcon fb)
	  $(use_enable sdl)

	  $(use_enable fontconfig)
	  $(use_enable fribidi)

	  $(use_enable harfbuzz)

	  $(use_enable egl)
	  $(use_enable pixman)

	  $(use_enable audio)
	  $(use_enable pulseaudio)
	  $(use_enable multisense)

	  $(use_enable physics)

	  $(use_enable systemd)

	  $(use_enable xim)
	  $(use_enable scim)
	  $(use_enable ibus)

	  $(use_enable gif image-loader-gif)
	  $(use_enable tiff image-loader-tiff)
	  $(use_enable webp image-loader-webp)

	  $(use_enable xine)
	  $(use_enable gstreamer gstreamer1)
	  $(use_enable v4l2)

	  $(use_enable curl)
	  $(use_enable tslib)

	  --with-crypto=${crypto}

	  --with-x11=${x11}
	  ${enable_graphics}

	  --with-opengl=${opengl}
	  --with-glib=${glib}
	  --enable-xinput22
	  --disable-gstreamer
#	"

#	  --enable-gesture

	efl_src_configure
}

src_install() {
	export MAKEOPTS="-j1"

	efl_src_install
}
