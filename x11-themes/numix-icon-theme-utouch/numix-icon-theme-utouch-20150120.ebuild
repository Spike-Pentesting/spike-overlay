# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3

DESCRIPTION="Official icon theme from the Numix project."
HOMEPAGE="https://numixproject.org"

if [[ ${PV} == "9999" ]] ; then
	SRC_URI=""
	EGIT_REPO_URI="https://github.com/numixproject/${PN}.git"
	KEYWORDS=""
else
	EGIT_REPO_URI="https://github.com/numixproject/${PN}.git"
	EGIT_COMMIT="1e764f7f7e6ecc2c6699cf78509a63f380518497"
	KEYWORDS="~amd64 ~arm ~x86"
fi

LICENSE="GPL-3.0+"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/share/icons
	doins -r Numix-uTouch
	dodoc README.md
}
