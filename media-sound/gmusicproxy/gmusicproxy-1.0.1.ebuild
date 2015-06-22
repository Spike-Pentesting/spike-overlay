# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=(python2_7)

inherit distutils-r1

DESCRIPTION="Google Play Music Proxy"
HOMEPAGE="https://github.com/diraimondo/gmusicproxy"
SRC_URI="https://github.com/diraimondo/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	dev-python/eyeD3:0.7[${PYTHON_USEDEP}]
	>=dev-python/gmusicapi-6[${PYTHON_USEDEP}]
	dev-python/netifaces[${PYTHON_USEDEP}]
	dev-python/python-daemon[${PYTHON_USEDEP}]
	dev-python/pyxdg[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"
