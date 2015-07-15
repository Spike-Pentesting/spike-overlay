# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=(python2_7)

inherit distutils-r1

DESCRIPTION="Web Client for Mopidy, built with AngularJS"
HOMEPAGE="http://mopidy.com https://github.com/martijnboland/moped"
SRC_URI="https://github.com/martijnboland/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="media-sound/mopidy[${PYTHON_USEDEP}]"
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
