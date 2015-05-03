# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=( python2_{6,7} )
inherit distutils-r1 git-r3

DESCRIPTION="Forensic tool for analyzing volatile memory"
HOMEPAGE="http://www.volatilityfoundation.org/"
SRC_URI=""
EGIT_REPO_URI="git://github.com/volatilityfoundation/volatility"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="-*"
IUSE=""

DEPEND=""
RDEPEND="dev-libs/libpcre
	dev-python/pycrypto
	>=dev-libs/distorm64-3"

src_install() {
	distutils-r1_src_install
	mkdir "${D}/usr/share/${PN}"
	mv "${D}/usr/contrib/plugins" "${D}/usr/share/${PN}/"
	rmdir "${D}/usr/contrib"
	mv "${D}/usr/tools" "${D}/usr/share/${PN}/"
	dosym /usr/bin/vol.py /usr/bin/volatility
}
