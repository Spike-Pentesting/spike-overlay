# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_7,3_3,3_4} )
inherit distutils-r1 git-2

DESCRIPTION="A Python library that provides an easy way to identify devices by parsing (browser) user agent strings."
HOMEPAGE="https://github.com/selwin/python-user-agents"
EGIT_REPO_URI="git://github.com/selwin/python-user-agents.git"
EGIT_COMMIT="v0.3.0"
SRC_URI=""

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-python/pyyaml
	dev-python/ua-parser"

DEPEND="${RDEPEND}"
