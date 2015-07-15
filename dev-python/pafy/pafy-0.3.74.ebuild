# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=(python{2_7,3_3})

inherit distutils-r1

DESCRIPTION="Python library to download YouTube content and retrieve metadata"
HOMEPAGE="https://github.com/mps-youtube/pafy"
SRC_URI="https://github.com/mps-youtube/pafy/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

DEPEND="test? ( dev-python/nose[${PYTHON_USEDEP}] )"

python_test() {
	nosetests || die
}
