# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit versionator autotools-utils python-single-r1

MY_DATE="$(get_version_component_range 1)"

DESCRIPTION="Library for binary signature scanning."

HOMEPAGE="https://github.com/libyal/libsigscan"
SRC_URI="https://github.com/libyal/${PN}/releases/download/${MY_DATE}/${PN}-experimental-${MY_DATE}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~hppa ~ppc ~x86"
IUSE="debug threads python unicode"
REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

DEPEND="python? ( ${PYTHON_DEPS} )
		dev-libs/libuna
		sys-libs/zlib
		app-forensics/libbfio"
RDEPEND="${DEPEND}"

AUTOTOOLS_IN_SOURCE_BUILD=1

pkg_setup() {
	use python && python-single-r1_pkg_setup
}

src_configure() {
	local myeconfargs=(
		$(use_enable unicode wide-character-type)
		$(use_enable threads multi-threading-support)
		$(use_enable python)
		$(use_enable debug debug-output)
		$(use_enable debug verbose-output)
	)
	autotools-utils_src_configure
}

src_compile() {
	autotools-utils_src_compile
	if use python; then
		emake -C pysigscan
	fi
}

src_install() {
	autotools-utils_src_install
	if use python; then
		emake -C pysigscan DESTDIR="${D}" install
	fi
}
