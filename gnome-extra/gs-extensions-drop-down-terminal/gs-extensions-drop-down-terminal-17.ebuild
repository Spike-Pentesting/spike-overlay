# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils gnome2-utils
DESCRIPTION="a gnome shell extension for an integrated dropdown terminal"
HOMEPAGE="https://github.com/zzrough/gs-extensions-drop-down-terminal"

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	SRC_URI=""
	EGIT_REPO_URI="https://github.com/zzrough/${PN}.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/zzrough/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm ~x86"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE=""

COMMON_DEPEND=">=dev-libs/glib-2.26:2
	       >=gnome-base/libgtop-2.28.3[introspection]
	       >=app-admin/eselect-gnome-shell-extensions-20120911"
RDEPEND="${COMMON_DEPEND}
	 >=gnome-base/gnome-shell-3.12
	 >=dev-libs/gjs-1.29
	 dev-libs/gobject-introspection
	 gnome-base/gnome-menus:3[introspection]
	 x11-libs/gdk-pixbuf:2[introspection]
	 x11-libs/gtk+:3[introspection]
	 x11-libs/pango[introspection]
	 dev-lang/vala
	 dev-libs/vala-common
	 dev-libs/gom
	 >=gnome-base/gnome-desktop-3.12
	 media-libs/gstreamer
	 sys-apps/dbus
	 dev-libs/dbus-glib
	 media-libs/libcanberra
	 x11-libs/libnotify
	 dev-db/sqlite:3
	 sys-power/upower
	 >=x11-libs/vte-0.30"
DEPEND="${COMMON_DEPEND}
	>=dev-util/intltool-0.50
	sys-devel/gettext
	virtual/pkgconfig"

src_install() {
	insinto "/usr/share/gnome-shell/extensions"
	doins -r "drop-down-terminal@gs-extensions.zzrough.org"
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
