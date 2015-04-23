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
	SRC_URI="https://github.com/snwh/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
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
