# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=(python2_7)

inherit vcs-snapshot distutils-r1

DESCRIPTION="Google Play Music extension for Mopidy"
HOMEPAGE="https://github.com/hechtus/mopidy-gmusic"
COMMIT_ID="0617ac778248e47a9df2ebfd6d9227519c5cba42"
SRC_URI="https://github.com/hechtus/${PN}/archive/${COMMIT_ID}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND=">=dev-python/pykka-1.1[${PYTHON_USEDEP}]
	>=dev-python/gmusicapi-6.0.0[${PYTHON_USEDEP}]
	media-sound/mopidy[${PYTHON_USEDEP}]"

DEPEND="test? ( ${RDEPEND}
	>=dev-python/mock-1.0[${PYTHON_USEDEP}]
	dev-python/nose[${PYTHON_USEDEP}] )
	dev-python/setuptools[${PYTHON_USEDEP}]"

DOCS=( README.rst )

python_test() {
	nosetests || die
}
