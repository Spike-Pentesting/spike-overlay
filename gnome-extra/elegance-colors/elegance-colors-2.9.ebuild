# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

VALA_MIN_API_VERSION="0.22"

inherit vala
DESCRIPTION="a chameleon theme for Gnome Shell."
HOMEPAGE="https://github.com/satya164/${MY_PN}.git"

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	SRC_URI=""
	EGIT_REPO_URI="https://github.com/satya164/${PN}.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/satya164/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm ~x86"
fi

LICENSE="GPL-3.0"
SLOT="0"

DEPEND="dev-libs/glib:2
	x11-libs/gtk+:3
	dev-lang/vala
	dev-libs/vala-common
	media-gfx/imagemagick
	gnome-base/gnome-shell
	gnome-extra/gnome-shell-extensions"
RDEPEND="${DEPEND}"

src_install() {
	emake CC="${VALAC}" DESTDIR="${D}" install
}
