# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit distutils python

DESCRIPTION="A collection of scripts built for reading Windows® NT/2K/XP/2K3 event log files"
HOMEPAGE="http://projects.sentinelchicken.org/grokevt/"
SRC_URI="http://projects.sentinelchicken.org/data/downloads/${P}.tar.gz"

LICENSE="GPL2"
SLOT="0"
KEYWORDS=""
IUSE=""
DISTUTILS_SETUP_FILES="grokevt-distutils.py"

DEPEND="dev-lang/python
	app-forensics/reglookup"

src_prepare() {
	echo "PATH_CONFIG='/etc/grokevt'" >> lib/grokevt.py
}

src_compile() {
	einfo "Nothing to compile"
}

src_install() {
	# upstream's Makefile makes too many assumptions
	dobin bin/grokevt-* || die 
	insinto /etc/grokevt
	doins -r etc/systems || die
	doman doc/man/man*/*.gz || die
	dodoc doc/devel/*.txt || die
	distutils_src_install
}
