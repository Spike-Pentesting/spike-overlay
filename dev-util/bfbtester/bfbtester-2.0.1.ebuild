# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit autotools

DESCRIPTION="Binary brute-force tester"
HOMEPAGE="http://bfbtester.sourceforge.net"
SRC_URI="mirror://sourceforge/bfbtester/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"

src_unpack() {
	unpack "${A}"
	cd "${S}"
	eautoreconf
}

src_install() {
	emake install DESTDIR="${D}"
	dodoc AUTHORS README
}
