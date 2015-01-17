# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="A collection of Perl scripts which facilitate the process of generating graphs from CSV inputs"
HOMEPAGE="http://afterglow.sourceforge.net/"
SRC_URI="mirror://sourceforge/afterglow/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
S="${WORKDIR}/${PN}"

DEPEND=""
RDEPEND="dev-lang/perl
	dev-perl/Text-CSV_XS
	dev-perl/IP-Anonymous"

src_unpack() {
	unpack ${A}
	cd "${S}"

	epatch "${FILESDIR}/${PN}-CSV_XS.patch"
}


src_install() {
	exeinto /usr/bin
	doexe src/perl/parsers/*.pl
	doexe src/perl/graph/*.pl
	doexe src/perl/loganalysis/*.pl

	dodir /etc/afterglow
	insinto /etc/afterglow
	doins src/perl/parsers/color.properties
	doins src/perl/parsers/color.sendmail.properties
}


