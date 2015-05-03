# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils autotools games

DESCRIPTION="A game resembling Thrust, but with lots of shooting and puzzles"
HOMEPAGE="http://www.markboyd.me.uk/games/flyhard/flyhard.html" # returns 404
SRC_URI="http://mirror.amdmi3.ru/distfiles/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="media-libs/libpng:0
	media-libs/libsdl[sound]
	media-libs/sdl-mixer[wav]"
DEPEND="${RDEPEND}
	dev-libs/boost"

src_prepare() {
	epatch "${FILESDIR}/${P}-Makefile.patch"
	# Needed for automake-1.13
	mv configure.in configure.ac || die
	eautoreconf
}

src_install() {
	default
	prepgamesdirs
}
