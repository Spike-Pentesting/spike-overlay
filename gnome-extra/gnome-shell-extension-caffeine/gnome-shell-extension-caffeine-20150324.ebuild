# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils gnome2-utils git-r3
DESCRIPTION="a gnome shell extension to disable screensaver and auto suspend"
HOMEPAGE="https://github.com/eonpatapon/gnome-shell-extension-caffeine"

if [[ ${PV} == "9999" ]] ; then
	SRC_URI=""
	EGIT_REPO_URI="https://github.com/eonpatapon/${PN}.git"
	KEYWORDS=""
else
	SRC_URI=""
	EGIT_REPO_URI="https://github.com/eonpatapon/${PN}.git"
	EGIT_COMMIT="09bb911b3560a709f1c31894c6031247851093ff"
	KEYWORDS="~amd64 ~arm ~x86"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE=""

COMMON_DEPEND=">=dev-libs/glib-2.26:2
	       >=gnome-base/libgtop-2.28.3[introspection]
	       >=app-eselect/eselect-gnome-shell-extensions-20120911"
RDEPEND="${COMMON_DEPEND}
	 >=gnome-base/gnome-shell-3.10
	 >=dev-libs/gjs-1.29
	 dev-libs/gobject-introspection
	 gnome-base/gnome-menus:3[introspection]
	 x11-libs/gdk-pixbuf:2[introspection]
	 x11-libs/gtk+:3[introspection]
	 x11-libs/pango[introspection]
	 dev-lang/vala
	 dev-libs/vala-common
	 >=gnome-base/gnome-desktop-3.10
	 media-libs/gstreamer
	 sys-apps/dbus
	 dev-libs/dbus-glib"
DEPEND="${COMMON_DEPEND}
	>=dev-util/intltool-0.50
	sys-devel/gettext
	virtual/pkgconfig"

src_install() {
	insinto "/usr/share/gnome-shell/extensions"
	doins -r "caffeine@patapon.info"
	dodoc README.md
}

pkg_postinst() {
        gnome2_schemas_update
        ebegin "Updating list of installed extensions"
        eselect gnome-shell-extensions update
        eend $?
}

pkg_postrm() {
        gnome2_schemas_update --uninstall
        ebegin "Updating list of installed extensions"
        eselect gnome-shell-extensions update
        eend $?
}

