# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit scons-utils distutils

DESCRIPTION="A small command line utility for reading and querying Windows NT/2K/XP registries"
HOMEPAGE="http://projects.sentinelchicken.org/reglookup/"
SRC_URI="http://projects.sentinelchicken.org/data/downloads/${PN}-src-${PV}.tar.gz"

LICENSE="GPL2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~x64-macos ~x86-macos"
IUSE=""

RDEPEND="sys-libs/talloc
	virtual/libiconv"

S="${WORKDIR}/${PN}-src-${PV}"
DISTUTILS_SETUP_FILES=pyregfi-distutils.py

src_compile() {
	escons
}

src_install() {
	distutils_src_install
	dobin bin/reglookup-timeline src/reglookup src/reglookup-recover
	dolib.so lib/libregfi.so
	doman doc/*.1.gz
	dodir /usr/include/regfi
	insinto /usr/include/regfi
	doins include/*.h
}
