# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit versionator autotools-utils python-single-r1 git-r3

MY_DATE="$(get_version_component_range 1)"
DESCRIPTION="Library and tools to access the PFF (Personal Folder File) format, used in PST and OST"
HOMEPAGE="http://github.com/libyal/libpff"
#SRC_URI="https://github.com/libyal/${PN}/releases/download/${MY_DATE}/${PN}-experimental-${MY_DATE}.tar.gz"
EGIT_REPO_URI="http://github.com/libyal/libpff"
EGIT_COMMIT="06397add0d8c966c8f0a861dd755d43cd7ef1596"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="debug java nls python unicode"
REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

DEPEND="nls? ( virtual/libiconv
			virtual/libintl )
		unicode? ( dev-libs/libuna )
		python? ( ${PYTHON_DEPS} )
		java? ( virtual/jdk )
		dev-libs/libuna
		app-forensics/libbfio"

AUTOTOOLS_IN_SOURCE_BUILD=1
AUTOTOOLS_AUTORECONF=1

pkg_setup() {
	use python && python-single-r1_pkg_setup
}

src_prepare() {
	# filthy hack around it not having these in the release
	sh ./synclibs.sh
	autotools-utils_src_prepare
}

src_configure() {
	local myeconfargs=(
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

src_compile() {
	autotools-utils_src_compile
	if use python; then
		emake -C pypff
	fi
}

src_install() {
	autotools-utils_src_install
	if use python; then
		emake -C pypff DESTDIR="${D}" install
	fi
}
