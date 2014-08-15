# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
VALA_MIN_API_VERSION="0.16"

inherit cmake-utils git-2 gnome2-utils vala

DESCRIPTION="Terminal emulator with semantic menus, smart command completion and other interactive features"
HOMEPAGE="http://finalterm.org/"
SRC_URI=""
EGIT_REPO_URI="https://github.com/p-e-w/finalterm.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="$(vala_depend)
	dev-libs/keybinder:3
	dev-libs/libgee:0.8
	>=media-libs/clutter-1.12.2
	media-libs/clutter-gtk
	x11-libs/gtk+:3
	x11-libs/libnotify
	x11-libs/mx"
DEPEND="${RDEPEND}
	dev-util/intltool
	virtual/pkgconfig"

src_prepare() {
	vala_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DVALA_EXECUTABLE="${VALAC}"
		-DGSETTINGS_COMPILE=OFF
		-DMINIMAL_FLAGS=ON
	)
	cmake-utils_src_configure
}

pkg_preinst() {
	gnome2_icon_savelist
	gnome2_schemas_savelist
}

pkg_postinst() {
	gnome2_icon_cache_update
	gnome2_schemas_update
}

pkg_postrm() {
	gnome2_icon_cache_update
	gnome2_schemas_update
}
