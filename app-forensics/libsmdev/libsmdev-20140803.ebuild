# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} )

inherit versionator autotools-utils distutils-r1

MY_DATE="$(get_version_component_range 1)"

DESCRIPTION="Library providing device abstraction"
HOMEPAGE="http://code.google.com/p/libsmdev/"
SRC_URI="https://googledrive.com/host/0B3fBvzttpiiSNEJFQ1FqanFYVUU/${PN}-alpha-${MY_DATE}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~x64-macos ~x86-macos"
IUSE="debug nls python unicode"

DEPEND="python? ( dev-lang/python )
	dev-libs/libuna
	nls? (
		virtual/libintl
		virtual/libiconv
	)"

AUTOTOOLS_IN_SOURCE_BUILD=1
DISTUTILS_IN_SOURCE_BUILD=1
DISTUTILS_SINGLE_IMPL=1
EPYTHON=python2.7

src_configure() {
	local myeconfargs=( '--disable-rpath'
		$(use_enable nls)
		$(use_with nls libiconv-prefix)
		$(use_with nls libintl-prefix)
		$(use_enable unicode wide-character-type)
		$(use_enable debug verbose-output)
		$(use_enable debug debug-output)
		$(use_enable python)
	)
	autotools-utils_src_configure
	use python && distutils-r1_src_configure
}

src_compile() {
	autotools-utils_src_compile
	if use python; then
		cd pysmdev
		distutils-r1_src_compile
	fi
}

src_install() {
	autotools-utils_src_install
	if use python; then
		cd pysmdev
		distutils-r1_src_install
	fi
}
