# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils gnome2-utils autotools
DESCRIPTION="a Shell Panel for Ozon OS."
HOMEPAGE="https://github.com/ozonos/${PN}"

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	SRC_URI=""
	EGIT_REPO_URI="https://github.com/ozonos/${PN}.git"
	KEYWORDS=""
else
	inherit git-r3
        SRC_URI=""
        EGIT_REPO_URI="https://github.com/ozonos/${PN}.git"
	EGIT_COMMIT="b26b8d83f88a7505c1e0b96f25af28266d62d47f"
	KEYWORDS="~amd64 ~arm ~x86"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE=""

COMMON_DEPEND=">=dev-libs/glib-2.26:2
	       >=gnome-base/libgtop-2.28.3[introspection]
	       >=app-eselect/eselect-gnome-shell-extensions-20120911"
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
	 sys-apps/dbus
	 dev-libs/dbus-glib
	 dev-db/sqlite:3
	 gnome-base/gnome-common
	 gnome-extra/gnome-tweak-tool"
DEPEND="${COMMON_DEPEND}
	>=dev-util/intltool-0.50
	sys-devel/gettext
	virtual/pkgconfig
	dev-vcs/git
	app-arch/zip"
src_prepare() {
	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install
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
