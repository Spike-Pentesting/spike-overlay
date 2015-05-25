# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-apps/rkflashtool/rkflashtool-5.1.ebuild,v 1.1 2014/01/08 04:43:34 mrueg Exp $

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit python-single-r1 waf-utils

DESCRIPTION="Tool for flashing Rockchip devices"
HOMEPAGE="https://github.com/linuxerwang/rkflashkit"
COMMIT_ID="224eeefec43f051e934055c37f32f331fe0d1499"
SRC_URI="https://github.com/linuxerwang/${PN}/archive/${COMMIT_ID}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

S=${WORKDIR}/${PN}-${COMMIT_ID}

RDEPEND="dev-python/pygtk[${PYTHON_USEDEP}]
	virtual/libusb:1
	${PYTHON_DEPS}"
DEPEND="${RDEPEND}"

NO_WAF_LIBDIR=1

src_prepare() {
	sed -i -e "s#debian/usr/share#usr/share#" -e "s/0.1.0/${PV}/" wscript || die
	sed -i -e "s#src#/usr/share/rkflashkit/lib/#" run.py || die
}

src_install() {
	waf-utils_src_install
	python_newscript run.py ${PN}
}
