# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit autotools-utils java-pkg-opt-2 java-ant-2 git-r3

SLOT=0
DESCRIPTION="A collection of file system and media management forensic analysis tools"
HOMEPAGE="http://www.sleuthkit.org/sleuthkit/"
SRC_URI=""
EGIT_REPO_URI="git://github.com/sleuthkit/sleuthkit"
LICENSE="GPL-2 IBM"
KEYWORDS="-*"

DEPEND="ewf? ( >=app-forensics/libewf-20120328 )
	java? ( virtual/jdk dev-java/ant-core )
	qcow? ( app-forensics/libqcow )
	vhdi? ( app-forensics/libvhdi )
	aff? ( app-forensics/afflib )
	dev-perl/DateManip
	sys-libs/zlib"

IUSE="aff +ewf java +qcow +vhdi"

AUTOTOOLS_IN_SOURCE_BUILD=1
AUTOTOOLS_AUTORECONF=1

src_prepare() {
	epatch ${FILESDIR}/${PN}-4.1.3-virtual-support.patch
	autotools-utils_src_prepare
}

src_configure() {
	local myeconfargs=(
		$(use_with aff afflib)
		$(use_with ewf libewf)
		$(use_with qcow libqcow)
		$(use_with vhdi libvhdi)
	)
	autotools-utils_src_configure
}
