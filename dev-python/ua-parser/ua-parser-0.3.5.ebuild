# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )
inherit distutils-r1 git-2

DESCRIPTION="A multi-language port of Browserscope's user agent parser."
HOMEPAGE="https://github.com/tobie/ua-parser"
EGIT_REPO_URI="git://github.com/ua-parser/uap-python.git"
EGIT_HAS_SUBMODULES=1
EGIT_COMMIT="6edfe377c7f07c8164d6d50f62a529dec5c851a8"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
python_compile() {
	distutils-r1_python_compile
	esetup.py sdist
}
