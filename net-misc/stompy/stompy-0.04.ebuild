# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="An advanced utility to test the quality of WWW session identifiers and other tokens that are meant to be unpredictable"
HOMEPAGE="http://lcamtuf.coredump.cx/"
SRC_URI="http://lcamtuf.coredump.cx/soft/${PN}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-libs/gmp dev-libs/openssl"
RDEPEND=${DEPEND}
S="${WORKDIR}/${PN}"

src_compile() {
	emake || die "make failed"
}

src_install() {
	dobin stompy
	dodoc doc/README doc/TODO doc/ChangeLog
}
