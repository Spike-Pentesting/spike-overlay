# Copyright 2012 Funtoo Technologies
# Distributed under the terms of the GNU General Public License v2

EAPI="5"
inherit autotools eutils

DESCRIPTION="a SUID security sandbox program that reduces the risk of security breaches by restricting the running environment of untrusted applications using Linux namespaces"
HOMEPAGE="http://l3net.wordpress.com/projects/firejail/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="sys-libs/glibc"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}/${P}"-makefile.patch
}

src_configure() {
	econf || die "econf failed"
}

src_compile() {
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR=${D} install || die "emake install failed"
}
