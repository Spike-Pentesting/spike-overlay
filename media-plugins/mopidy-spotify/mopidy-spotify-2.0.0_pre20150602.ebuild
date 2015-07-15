# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=(python2_7)

inherit vcs-snapshot distutils-r1

DESCRIPTION="Mopidy extension for playing music from Spotify"
HOMEPAGE="http://mopidy.com https://github.com/mopidy/mopidy-spotify"
COMMIT_ID="70f27932cbc728693140d5d264054fb8c777516f"
SRC_URI="https://github.com/mopidy/${PN}/archive/${COMMIT_ID}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="dev-python/pykka[${PYTHON_USEDEP}]
	>=dev-python/pyspotify-2.0.0[${PYTHON_USEDEP}]
	media-sound/mopidy[${PYTHON_USEDEP}]"

DEPEND="test? ( ${RDEPEND}
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/pytest-capturelog[${PYTHON_USEDEP}] )
	dev-python/setuptools[${PYTHON_USEDEP}]"

DOCS=( README.rst )

python_test() {
	py.test || die
}
