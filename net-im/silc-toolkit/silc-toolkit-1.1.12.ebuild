# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# schism@subverted.org

EAPI=5

inherit eutils autotools-utils

DESCRIPTION="SDK for the SILC protocol"
HOMEPAGE="http://silcnet.org/"
SRC_URI="mirror://sourceforge/silc/silc/toolkit/sources/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 sparc x86 ~x86-fbsd"
IUSE="debug gmp iconv ipv6 socks5"

RDEPEND=""
DEPEND="virtual/pkgconfig
	gmp? ( dev-libs/gmp )
	socks5? ( net-proxy/dante )
	iconv? ( virtual/libiconv )"

AUTOTOOLS_IN_SOURCE_BUILD=1

src_prepare() {
	# They have incorrect DESTDIR usage
	sed -i \
		"s/^\(pkgconfigdir =\) \$(libdir)\/pkgconfig/\1	\/usr\/$(get_libdir)\/pkgconfig/"\
		"${S}"/lib/Makefile.{am,in}
	autotools-utils_src_prepare
}

src_configure() {
	local myeconfargs=(
		--datadir="${EPREFIX}/usr/share/${PN}"
		--datarootdir="${EPREFIX}/usr/share/${PN}"
		--includedir="${EPREFIX}/usr/include/${PN}"
		--sysconfdir="${EPREFIX}/etc/silc"
		--libdir="${EPREFIX}/usr/$(get_libdir)/${PN}"
		--docdir="${EPREFIX}/usr/share/doc/${PF}"
		--disable-optimizations
		--disable-asm
		--with-simdir=/usr/$(get_libdir)/${PN}/modules
		$(use_with gmp)
		$(use_enable debug)
		$(use_enable ipv6)
	)
	if ! use iconv; then
		# their --with-iconv is inverted but automagic
		myeconfargs+=( --with-iconv )
	fi
	if use socks5; then
		# their --with-socks5 only works one way
		myeconfargs+=( --with-socks5 )
	fi
	autotools-utils_src_configure
}
