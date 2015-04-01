# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils autotools gnome2 git-r3

DESCRIPTION="a Gnome shell extension for displaying weather informations from several cities"
HOMEPAGE="https://github.com/Neroth/gnome-shell-extension-weather"

if [[ ${PV} == "9999" ]] ; then
	SRC_URI=""
	EGIT_REPO_URI="https://github.com/Neroth/${PN}.git"
	KEYWORDS=""
else
	SRC_URI=""
	EGIT_REPO_URI="https://github.com/Neroth/${PN}.git"
	EGIT_COMMIT="329139f7238d439613780e6f520c5259c1390019"
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
	 >=gnome-base/gnome-desktop-3.12
	 sys-apps/dbus
	 dev-libs/dbus-glib
	 gnome-base/dconf
 	 app-arch/zip
	 dev-vcs/git
	 gnome-base/gnome-common"
DEPEND="${COMMON_DEPEND}
	>=dev-util/intltool-0.50
	sys-devel/gettext
	virtual/pkgconfig
	dev-libs/libgweather"

src_prepare() {
	eautoreconf
}
src_install() {
	emake DESTDIR="${D}" install
	dodoc README.md
}

pkg_postinst() {
	gnome2_pkg_postinst
	ebegin "Updating list of installed extensions"
	eselect gnome-shell-extensions update
	eend $?
}

pkg_postrm() {
	gnome2_pkg_postrm
	ebegin "Updating list of installed extensions"
        eselect gnome-shell-extensions update
        eend $?
}
