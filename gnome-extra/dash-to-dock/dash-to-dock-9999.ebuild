# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

EXTENSIONS_PREFIX="extensions.gnome-org"
MY_AUTHOR="micheleg"
inherit eutils gnome2-utils
DESCRIPTION="an extension that transform Gnome shell dash in a dock"
HOMEPAGE="https://github.com/${MY_AUTHOR}/${PN}"

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	SRC_URI=""
	EGIT_REPO_URI="https://github.com/${MY_AUTHOR}/${PN}.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/${MY_AUTHOR}/${PN}/archive/${EXTENSIONS_PREFIX}-v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm ~x86"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE=""

COMMON_DEPEND=">=dev-libs/glib-2.26:2
	       >=gnome-base/libgtop-2.28.3[introspection]
	       >=app-eselect/eselect-gnome-shell-extensions-20120911"
RDEPEND="${COMMON_DEPEND}
	 =gnome-base/gnome-shell-3.16*
	 >=dev-libs/gjs-1.29
	 dev-libs/gobject-introspection
	 gnome-base/gnome-menus:3[introspection]
	 x11-libs/gdk-pixbuf:2[introspection]
	 x11-libs/gtk+:3[introspection]
	 x11-libs/pango[introspection]
	 dev-lang/vala
	 dev-libs/vala-common
	 dev-libs/gom
	 =gnome-base/gnome-desktop-3.16*
	 media-libs/gstreamer
	 sys-apps/dbus
	 dev-libs/dbus-glib
	 media-libs/libcanberra
	 x11-libs/libnotify
	 dev-db/sqlite:3
	 sys-power/upower"
DEPEND="${COMMON_DEPEND}
	>=dev-util/intltool-0.50
	sys-devel/gettext
	virtual/pkgconfig"
S="${WORKDIR}/${PN}-${EXTENSIONS_PREFIX}-v${PV}"

src_install() {
	emake INSTALLBASE="${D}usr/share/gnome-shell/extensions" VERSION=${PV} install
	insinto "/usr/share/glib-2.0/schemas/"
	doins "schemas/org.gnome.shell.extensions.dash-to-dock.gschema.xml"
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
