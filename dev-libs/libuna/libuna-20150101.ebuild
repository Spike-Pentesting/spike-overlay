# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit versionator autotools-utils

MY_DATE="$(get_version_component_range 1)"

DESCRIPTION="Library to support Unicode and ASCII (byte string) conversions"
HOMEPAGE="https://github.com/libyal/libuna/"
SRC_URI="https://github.com/libyal/${PN}/releases/download/${MY_DATE}/${PN}-alpha-${MY_DATE}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~x64-macos ~x86-macos"
IUSE="nls unicode"
DEPEND="nls? (
			virtual/libintl
			virtual/libiconv )"
		#dev-libs/libcerror
		#dev-libs/libcfile
		#dev-libs/libcdatetime
		#dev-libs/libclocale
		#dev-libs/libcnotify"

#S="${WORKDIR}/${PN}-${MY_DATE}"
AUTOTOOLS_IN_SOURCE_BUILD=1
AUTOTOOLS_AUTORECONF=1

#src_prepare() {
	#epatch ${FILESDIR}/${P}-libcsystem.patch
#}

src_configure() {
	local myeconfargs=( '--disable-rpath'
		$(use_enable nls)
		$(use_enable unicode wide-character-type)
	)
	autotools-utils_src_configure
}
