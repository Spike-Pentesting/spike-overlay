# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit autotools eutils 
#git-r3

DESCRIPTION="a command-line based markdown presentation tool"
HOMEPAGE="https://github.com/visit1985/mdp.git"
#EGIT_REPO_URI="git://github.com/visit1985/mdp.git"
#EGIT_COMMIT="${PV}"
SRC_URI="https://github.com/visit1985/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
S="${WORKDIR}/${P}"

DEPEND="sys-libs/ncurses"
RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}" install
}
