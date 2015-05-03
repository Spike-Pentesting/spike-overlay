# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-mathematics/calc/calc-2.12.4.4.ebuild,v 1.1 2012/08/09 17:52:26 bicatali Exp $

EAPI=5

inherit eutils multilib toolchain-funcs

DESCRIPTION="Arbitrary precision C-like arithmetic system"
HOMEPAGE="http://www.isthe.com/chongo/tech/comp/calc/"
SRC_URI="http://www.isthe.com/chongo/src/calc/${P}.tar.bz2"

SLOT="0"
LICENSE="LGPL-2"
KEYWORDS="~amd64"

IUSE=""

DEPEND="
	sys-libs/ncurses
	sys-libs/readline"
RDEPEND="${DEPEND}"

src_prepare() {
	# Rework patches before adding it to the main tree!
	epatch "${FILESDIR}"/${P}-prefix.patch \
		"${FILESDIR}"/${P}-ldflags.patch
	ln -sf libcustcalc.so.${PV} custom/libcustcalc.so
	sed -i -e "/DIR/s:/usr:${EPREFIX}/usr:g" Makefile || die
}

src_compile() {
	# parallel compilation hard to fix. better to leave upstream.
	emake -j1 \
		CC="$(tc-getCC)" \
		DEBUG="${CFLAGS}" \
		LDFLAGS="${LDFLAGS}" \
		CALCPAGER="${PAGER}" \
		USE_READLINE="-DUSE_READLINE" \
		READLINE_LIB="-lreadline -lhistory -lncurses -L${S}/custom -lcustcalc" \
		all
}

src_test() {
	if echo "${LD_PRELOAD}" | grep -q "sandbox"; then
		ewarn "Can't run check when running in sandbox - see bug #59676"
	else
		emake chk
	fi
}

src_install() {
	emake \
		T="${D}" \
		LIBDIR="${EPREFIX}/usr/$(get_libdir)" \
		install
	dodoc BUGS CHANGES LIBRARY README
}
