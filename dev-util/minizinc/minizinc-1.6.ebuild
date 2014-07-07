# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

DESCRIPTION="Medium-level constraint modelling language, contains executables for the G12 MiniZinc-to-FlatZinc converter and the G12 FlatZinc interpreter."
HOMEPAGE="http://www.minizinc.org/"
LICENSE="NICTA"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

SRC_URI="http://www.minizinc.org/downloads/release-${PV}/${P}-x86_64-unknown-linux-gnu.tar.gz
	 x86?   ( http://www.minizinc.org/downloads/release-${PV}/${P}-i686-pc-linux-gnu.tar.gz )"

DEPEND=""
RDEPEND=""

src_prepare() {
        rm -r COPYING
	rm -r README
	rm -r SETUP
	rm -r NEWS
	rm -r AUTHORS
}

src_install() {
	if use doc; then
        	dodoc -r doc/man/*
        	rm -r doc
	fi

        insinto /usr/share/${PN}
	cp -p -R ${S}/* ${D}usr/share/${PN}

        dobin "${FILESDIR}"/mzn2fzn
	dobin "${FILESDIR}"/flatzinc

}


