# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
E_PKG_IUSE="examples"
E_PYTHON="yes"
EFL_USE_GIT="yes"
EFL_GIT_REPO_CATEGORY="bindings/python"
inherit efl distutils

DESCRIPTION="Python bindings for  EFL"
HOMEPAGE="http://www.enlightenment.org"
SRC_URI=""

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS=""

IUSE=""

RDEPEND="
	>=dev-python/cython-0.17.3
	>=dev-libs/efl-9999"
