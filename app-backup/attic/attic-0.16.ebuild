# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{3_3,3_4} )

inherit distutils-r1

DESCRIPTION="A deduplicating backup program"
SRC_URI="https://github.com/jborg/attic/archive/${PV}.tar.gz -> ${P}.tar.gz"
HOMEPAGE="https://attic-backup.org/ https://github.com/jborg/attic"

IUSE="test"
SLOT="0"
LICENSE="BSD"
KEYWORDS="~amd64"

RDEPEND="dev-python/msgpack[${PYTHON_USEDEP}]
	dev-python/llfuse[${PYTHON_USEDEP}]
	dev-python/pyopenssl[${PYTHON_USEDEP}]"

DEPEND="test? ( ${RDEPEND} )"

RESTRICT="test"

python_test() {
	# With 0.16 14 tests failed
	cd docs/ || die
	${EPYTHON} ../attic/testsuite/run.py || die
}
