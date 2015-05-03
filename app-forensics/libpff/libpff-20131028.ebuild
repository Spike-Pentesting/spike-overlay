# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools-utils

MY_P=${P/${PN}/${PN}-experimental}
DESCRIPTION="Library and tools to access the PFF (Personal Folder File) format, used in PST and OST"
HOMEPAGE="http://code.google.com/p/libpff"
SRC_URI="https://googledrive.com/host/0B3fBvzttpiiScU9qcG5ScEZKZE0/${MY_P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~x64-macos ~x86-macos"
IUSE="debug java nls python unicode"

DEPEND="nls? ( virtual/libiconv
			virtual/libintl )
		unicode? ( dev-libs/libuna )
		python? ( dev-lang/python )
		java? ( virtual/jdk )
		dev-libs/libuna
		app-forensics/libbfio"
AUTOTOOLS_IN_SOURCE_BUILD=1

src_configure() {
	local myeconfargs=( '--disable-rpath'
		$(use_enable java)
		$(use_enable nls)
		$(use_with nls libiconv-prefix)
		$(use_with nls libintl-prefix)
		$(use_enable unicode wide-character-type)
		$(use_enable debug debug-output)
		$(use_enable debug verbose-output)
		$(use_enable python)
	)
	autotools-utils_src_configure
}
