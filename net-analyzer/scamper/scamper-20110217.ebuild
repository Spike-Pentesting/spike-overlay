# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Conducts Internet measurement tasks to large numbers of IPv4 and IPv6 addresses, in parallel, to fill a specified packets-per-second rate."
HOMEPAGE="http://www.wand.net.nz/scamper/"
SRC_URI="http://www.wand.net.nz/scamper/scamper-cvs-20110217.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="privsep debug"
EAPI=2

DEPEND=""
RDEPEND="${DEPEND}"

inherit eutils

S="${WORKDIR}/scamper-cvs-20110217"

src_configure() {
	econf \
		$(use_enable privsep privsep) \
		$(use_enable debug debug-file) || die
}

src_install() {
	emake install DESTDIR="${D}" || die
}
