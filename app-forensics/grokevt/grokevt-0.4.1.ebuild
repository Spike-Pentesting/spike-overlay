# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils python

DESCRIPTION="A collection of scripts built for reading Windows® NT/2K/XP/2K3 event log files"
HOMEPAGE="http://projects.sentinelchicken.org/grokevt/"
SRC_URI="http://projects.sentinelchicken.org/data/downloads/${P}.tar.gz"

LICENSE="GPL2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~x64-macos ~x86-macos"
IUSE=""

DEPEND="dev-lang/python
	app-forensics/reglookup"

src_unpack() {
	default
	cd "${S}/lib"
	echo "PATH_CONFIG='/etc/grokevt'" >> grokevt.py
}

src_compile() {
	einfo "Nothing to compile"
}

src_install() {
	dobin bin/grokevt*
	doman doc/man/man1/* doc/man/man7/*
	insinto $(python_get_sitedir)
	doins lib/grokevt.py
	mkdir -p ${D}/etc/grokevt/systems/
	cp -Rf etc/systems/example ${D}/etc/grokevt/systems/
}
