# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_{6,7} )
inherit versionator python-single-r1 autotools-utils

MY_DATE="$(get_version_component_range 1)"

DESCRIPTION="Library and tools to support the Volume Shadow Snapshot (VSS) format."
HOMEPAGE="http://code.google.com/p/libvshadow/"
SRC_URI="https://googledrive.com/host/0B3fBvzttpiiSZDZXRFVMdnZCeHc/${PN}-alpha-${MY_DATE}.tar.gz"

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~x86-macos ~x64-macos"
IUSE="debug python nls unicode"

DEPEND="
	nls? (
		virtual/libintl
		virtual/libiconv
	)
	python? ( dev-lang/python )
	sys-fs/fuse
	dev-libs/libuna
	app-forensics/libbfio"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}-${MY_DATE}"
AUTOTOOLS_IN_SOURCE_BUILD=1

src_configure() {
	local myeconfargs=( '--disable-rpath'
		$(use_enable nls)
		$(use_with nls libiconv-prefix)
		$(use_with nls libintl-prefix)
		$(use_enable unicode wide-character-type)
		$(use_enable debug debug-output)
		$(use_enable debug verbose-output)
		$(use_enable python)
	)
	autotools-utils_src_configure
	use python && python-single-r1_src_configure
}

src_compile() {
	autotools-utils_src_compile
	if use python; then
		cd pyvshadow
		python-single-r1_src_compile
	fi
}

src_install() {
	autotools-utils_src_install
	if use python; then
		cd pyvshadow
		python-single-r1_src_install
	fi
}
