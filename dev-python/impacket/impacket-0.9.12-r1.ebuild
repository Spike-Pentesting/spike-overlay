# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MY_PN=Impacket
MY_P=${MY_PN}-${PV}

PYTHON_COMPAT=( python2_{6,7} )
inherit distutils-r1 versionator

DESCRIPTION="A collection of Python classes focused on providing access to network packets"
HOMEPAGE="https://github.com/CoreSecurity/impacket"
SRC_URI="https://github.com/CoreSecurity/impacket/archive/impacket_${PV//./_}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="dev-python/pycrypto"

DEPEND="test? ( dev-python/nose[${PYTHON_USEDEP}] )"

python_test() {
    nosetests || die "Tests fail with ${EPYTHON}"
}
