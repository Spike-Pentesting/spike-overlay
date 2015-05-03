# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=(python2_7)

inherit versionator vcs-snapshot distutils-r1

DESCRIPTION="Python bindings generator for C/C++ libraries"
HOMEPAGE="https://launchpad.net/pybindgen"
#SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"
SRC_URI="https://bazaar.launchpad.net/~gjc/${PN}/trunk/tarball/${PV##*.} -> ${P}.tar.gz"
LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

S=${WORKDIR}/${P}/pybindgen/trunk/

DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

src_prepare() {
	echo "__version__ = [$(replace_all_version_separators ', ')]" > pybindgen/version.py || die
	distutils-r1_src_prepare
}
python_test() {
	${EPYTHON} ./waf configure || die
	${EPYTHON} ./waf check || die
}
