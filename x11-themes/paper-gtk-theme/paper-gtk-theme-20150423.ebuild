# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="the Paper gtk theme by snwh"
HOMEPAGE="https://github.com/snwh/${PN}"

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	SRC_URI=""
	EGIT_REPO_URI="https://github.com/snwh/${PN}.git"
	KEYWORDS=""
else
	inherit git-r3
        SRC_URI=""
        EGIT_REPO_URI="https://github.com/snwh/${PN}.git"
	EGIT_COMMIT="ead9b4d36f83ff9475f649f8dc2c3b7a3315adbd"
	KEYWORDS="~amd64 ~arm ~x86"
fi

LICENSE="GPL-3.0"
SLOT="0"

DEPEND=">=gnome-base/gnome-shell-3.12
        gnome-extra/gnome-shell-extensions"
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/share/themes/
	doins -r Paper
	dodoc README.md
}
