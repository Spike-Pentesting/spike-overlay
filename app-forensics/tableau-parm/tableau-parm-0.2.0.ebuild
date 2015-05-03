# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A small command line utility designed to interact with Tableau forensic write blockers"
HOMEPAGE="http://projects.sentinelchicken.org/tableau-parm/"
SRC_URI="http://projects.sentinelchicken.org/data/downloads/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"

DEPEND=""
RDEPEND=""

src_install() {
	dobin build/bin/tableau-parm
	doman build/doc/man/man1/*
}
