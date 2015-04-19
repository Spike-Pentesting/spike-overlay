# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 python3_3 python3_4 )
inherit distutils-r1 git-2

DESCRIPTION="A simple library to encode/decode DNS wire-format packets."
HOMEPAGE="https://bitbucket.org/paulc/dnslib"
EGIT_REPO_URI="git://github.com/paulchakravarti/dnslib.git"
EGIT_COMMIT="0.9.3"
SRC_URI=""

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
