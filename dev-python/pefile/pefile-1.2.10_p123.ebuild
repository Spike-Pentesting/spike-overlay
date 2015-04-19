# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=5

inherit distutils

MY_P=${P/_p/-}
DESCRIPTION="Module to read and work with Portable Executable (PE) files"
HOMEPAGE="http://code.google.com/p/pefile/"
SRC_URI="http://${PN}.googlecode.com/files/${MY_P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~x64-macos ~x86-macos"
IUSE=""

DEPEND=""

S="${WORKDIR}/${MY_P}"
