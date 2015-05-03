# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-im/silc-client/silc-client-1.1.6.ebuild,v 1.1 2008/11/27 10:29:18 armin76 Exp $

EAPI="2"

inherit eutils multilib

DESCRIPTION="IRSSI-based text client for Secure Internet Live Conferencing"
SRC_URI="http://www.silcnet.org/download/client/sources/${P}.tar.bz2"
HOMEPAGE="http://silcnet.org/"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~ppc ~ppc64 ~sparc ~x86"
IUSE="ipv6 perl debug threads"

COMMONDEPEND="perl? ( sys-devel/libperl )
	sys-libs/ncurses
	>=dev-libs/glib-2.8
	!<=net-im/silc-toolkit-0.9.12-r1"

DEPEND="${COMMONDEPEND}
	dev-util/pkgconfig"

RDEPEND="${COMMONDEPEND}
	perl? (
		!net-irc/irssi[perl]
		!net-irc/irssi-svn[perl]
	)"

src_prepare() {
	sed -i -e "s:-g -O2:${CFLAGS}:g" configure
	use amd64 && sed -i -e 's:felf\([^6]\):felf64\1:g' configure
	epatch ${FILESDIR}/${P}-sandbox.patch
}

src_configure() {
	local myconf=""
	econf \
		--datadir=/usr/share/${PN} \
		--datarootdir=/usr/share/${PN} \
		--mandir=/usr/share/man \
		--includedir=/usr/include/${PN} \
		--sysconfdir=/etc/silc \
		--with-helpdir=/usr/share/${PN}/help \
		--libdir=/usr/$(get_libdir)/${PN} \
		--docdir=/usr/share/doc/${PF} \
		--disable-optimizations \
		$(use_enable ipv6) \
		$(use_enable debug) \
		$(use_with perl) \
		$(use_with threads pthreads) \
		${myconf}
}

src_install() {
	local myflags=""

	if use perl
	then
		R1="s/installsitearch='//"
		R2="s/';//"
		perl_sitearch="`perl -V:installsitearch | sed -e ${R1} -e ${R2}`"
		myflags="${myflags} INSTALLPRIVLIB=/usr/$(get_libdir)"
		myflags="${myflags} INSTALLARCHLIB=${perl_sitearch}"
		myflags="${myflags} INSTALLSITELIB=${perl_sitearch}"
		myflags="${myflags} INSTALLSITEARCH=${perl_sitearch}"
	fi

	make DESTDIR="${D}" ${myflags} install || die "make install failed"

	rm -rf "${D}"/etc "${D}"/usr/libsilc* "${D}"/usr/include

	dodoc ChangeLog CREDITS README TODO
	cd "${S}/apps/irssi"
	dodoc silc.conf docs/formats.txt docs/manual.txt docs/signals.txt docs/special_vars.txt
	dohtml docs/startup-HOWTO.html

	insinto /usr/share/silc-client/help
	rm docs/help/Make*
	doins docs/help/*
}
