# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} )

inherit versionator autotools-utils distutils-r1

MY_DATE="$(get_version_component_range 1)"

DESCRIPTION="Library and tools to access the VMware Virtual Disk (VMDK) image format"
HOMEPAGE="https://code.google.com/p/libvmdk"
SRC_URI="https://googledrive.com/host/0B3fBvzttpiiSQ1dOUmhqMkR2cm8/${PN}-experimental-${MY_DATE}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~hppa ~ppc ~x86"
IUSE="debug fuse python unicode"

DEPEND="python? ( dev-lang/python )
		fuse? ( sys-fs/fuse )
		dev-libs/libuna
		sys-libs/zlib
		app-forensics/libbfio"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}-${MY_DATE}"
AUTOTOOLS_IN_SOURCE_BUILD=1

src_configure() {
	local myeconfargs=( '--disable-rpath'
		$(use_enable unicode wide-character-type)
		$(use_enable python)
		$(use_enable debug debug-output)
		$(use_enable debug verbose-output)
		$(use_with fuse libfuse)
	)
	autotools-utils_src_configure
	use python && distutils-r1_src_configure
}

src_compile() {
	autotools-utils_src_compile
	if use python; then
		cd pyvmdk
		distutils-r1_src_compile
	fi
}

src_install() {
	autotools-utils_src_install
	if use python; then
		cd pyvmdk
		distutils-r1_src_install
	fi
}
