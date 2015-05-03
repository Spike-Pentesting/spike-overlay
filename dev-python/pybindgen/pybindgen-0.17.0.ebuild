# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=(python2_7)
MY_PN=PyBindGen
MY_P=${MY_PN}-${PV}

inherit distutils-r1

DESCRIPTION="Python bindings generator for C/C++ libraries"
HOMEPAGE="https://launchpad.net/pybindgen"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

S=${WORKDIR}/${MY_P}

DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

python_test() {
	${EPYTHON} ./waf configure || die
	${EPYTHON} ./waf check || die
}
