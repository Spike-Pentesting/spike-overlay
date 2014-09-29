# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

PYTHON_DEPEND="2"

inherit distutils

DESCRIPTION="A python script to decode yahoo instant message archive files"
HOMEPAGE="http://www.1vs0.com/tools.html"
SRC_URI="http://www.1vs0.com/code/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_prepare() {
	python_convert_shebangs 2 ${PN}
}

src_install() {
	distutils_src_install
	doman ${PN}.man.1 || die
}
