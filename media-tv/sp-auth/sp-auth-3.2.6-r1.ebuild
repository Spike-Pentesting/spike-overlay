# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils

MY_P="sp-sc-auth"

DESCRIPTION="SopCast free P2P Internet TV binary"
LICENSE="SopCast-unknown-license"
HOMEPAGE="http://www.sopcast.com/"
SRC_URI="http://sopcast-player.googlecode.com/files/${PN}-${PV}.tar.gz"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="strip"

# All dependencies might not be listed, since the binary blob's homepage only lists libstdc++
RDEPEND="amd64? ( sys-libs/libstdc++-v3[multilib] )
	x86? ( >=virtual/libstdc++-3.3 )"

DEPEND="${RDEPEND}"

S=${WORKDIR}/${PN}

src_install() {
	exeinto /usr/bin/
	newexe sp-sc-auth ${MY_P} || die "newexe failed"
	dodoc Readme || die "dodoc failed"
}
