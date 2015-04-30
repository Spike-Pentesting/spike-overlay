# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3
DESCRIPTION="Official icon theme circle from the Numix project."
HOMEPAGE="https://numixproject.org"

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	SRC_URI=""
	EGIT_REPO_URI="https://github.com/numixproject/${PN}.git"
	KEYWORDS=""
else
	SRC_URI=""
	EGIT_REPO_URI="https://github.com/numixproject/${PN}.git"
	EGIT_COMMIT="a6b742743d88f6d8c956a7ba83ea7e030cd05eb7"
	KEYWORDS="~amd64 ~arm ~x86"
fi

LICENSE="GPL-3.0+"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/share/icons
	doins -r Numix-Circle Numix-Circle-Light
	dodoc readme.md
}
