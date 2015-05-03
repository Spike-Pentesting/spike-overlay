# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit qt4-r2

DESCRIPTION="Network animator based on Qt4 working with ns-3"
HOMEPAGE="http://www.nsnam.org/wiki/index.php/NetAnim"
COMMIT_ID="c9866156ebf3"
SRC_URI="http://code.nsnam.org/netanim/archive/${COMMIT_ID}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

S=${WORKDIR}/${PN}-${COMMIT_ID}

DEPEND="dev-qt/qtcore:4
	dev-qt/qtgui:4"
RDEPEND="${DEPEND}"

src_install() {
	dodoc RELEASE_NOTES
	dobin NetAnim
}
