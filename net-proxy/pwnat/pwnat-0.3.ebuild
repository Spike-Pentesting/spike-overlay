# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=4
inherit eutils
DESCRIPTION="allows clients behind NATs to communicate with a server behind a separate NAT to communicate with each other"
HOMEPAGE="http://samy.pl/pwnat/"

SRC_URI="http://samy.pl/pwnat/${P}-beta.tgz"
LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
RDEPEND="${DEPEND}"
S="${WORKDIR}/${P}"-beta

src_install() {
        dobin "${PN}" || die "install failed"
}
