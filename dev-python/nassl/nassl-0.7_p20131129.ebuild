# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: blshkv$

EAPI=5

PYTHON_COMPAT=( python2_7 )
inherit  python-r1 python-utils-r1 git-2

DESCRIPTION="Experimental Python wrapper for OpenSSL"
HOMEPAGE="https://github.com/nabla-c0d3/nassl"
EGIT_REPO_URI="https://github.com/nabla-c0d3/nassl.git"
EGIT_COMMIT="85c100753a8f7412493588f2fec2533c60213f4e"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/openssl
	sys-libs/zlib"
RDEPEND=""

#FIXME python eclass must be used instead
src_prepare() {
	python2.7 setup_unix.py build
}

src_install() {
	MY_ARCH=$(uname -m)
	python_moduleinto nassl
	python_foreach_impl python_domodule "${S}/build/lib.linux-${MY_ARCH}-2.7/${PN}"/*
}
