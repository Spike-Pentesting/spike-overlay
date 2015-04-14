# Copyright 1999-2014 Spike Linux
# Distributed under the terms of the GNU General Public License v2
# Header: $

EAPI=5

inherit gnome2-utils

DESCRIPTION="Spike Linux Official GNOME artwork"
HOMEPAGE="http://www.spike-pentesting.org/"
SRC_URI="mirror://spike/${CATEGORY}/${PN}/${PN}-${PVR}.tar.xz"
LICENSE="CCPL-Attribution-ShareAlike-3.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""
RDEPEND="spike/spike-artwork-core
	 x11-themes/equinox-themes
	 x11-themes/elementary-icon-theme[monochrome,branding]
	 x11-themes/korora-shell-theme
	 x11-themes/numix-icon-theme-circle
	 gnome-extra/dash-to-dock
	 gnome-extra/gnome-shell-extension-caffeine
	 gnome-extra/gnome-shell-extension-weather
	 gnome-extra/gs-extensions-drop-down-terminal"

S="${WORKDIR}/${PN}"

src_install() {
	dodir /usr/share/themes

	# GNOME & GTK Theme
	cd "${S}"/gtk
	dodir /usr/share/themes
	insinto /usr/share/themes
	doins -r ./*

	# Metacity
	cd "${S}"/metacity
	insinto /usr/share/themes
	doins -r ./*

	# GNOME 3 config settings
	dodir /usr/share/glib-2.0/schemas
	insinto /usr/share/glib-2.0/schemas
	doins "${FILESDIR}/org.spike.gschema.override"

	# GDM 3.6+ logo stuff
	cd "${S}/gdm"
	dodir /usr/share/spike/gdm
	insinto /usr/share/spike/gdm
	doins logo.svg
	insinto /usr/share/glib-2.0/schemas
	doins org.gnome.login-screen.gschema.override
}

pkg_preinst() {
	# taken from gnome2_schemas_savelist
	has ${EAPI:-0} 0 1 2 && ! use prefix && ED="${D}"
	pushd "${ED}" &>/dev/null
	export GNOME2_ECLASS_GLIB_SCHEMAS="/usr/share/glib-2.0/schemas/org.spike.gschema.override"
	popd &>/dev/null
}

pkg_postinst() {
	gnome2_schemas_update
}

pkg_postrm() {
	gnome2_schemas_update --uninstall
}
