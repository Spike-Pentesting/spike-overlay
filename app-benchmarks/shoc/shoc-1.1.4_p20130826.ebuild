# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-apps/fwts/fwts-13.09.01.ebuild,v 1.1 2013/09/23 07:56:44 mrueg Exp $

EAPI=5

inherit vcs-snapshot autotools
DESCRIPTION="Scalable Heterogeneous Computing Benchmark Suite"
HOMEPAGE="http://keeneland.gatech.edu/software/keeneland/shoc"
COMMIT_ID="2b00f6123ff21eb08ea006b5039ad7202ba2035f"
SRC_URI="https://github.com/vetter/${PN}/archive/${COMMIT_ID}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cuda mpi opencl"

RDEPEND="cuda? ( dev-util/nvidia-cuda-sdk )
	mpi? ( virtual/mpi )
	opencl? ( virtual/opencl )"

DEPEND="${RDEPEND}"

src_prepare(){
	eautoreconf
}

src_configure() {
	local myeconfargs=(
		$(use_with cuda)
		$(use_with mpi)
		$(use_with opencl)
	)
	econf $myeconfargs
}
