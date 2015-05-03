# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils toolchain-funcs

DESCRIPTION="A micro-ide/text editor written in C/GTK+"
HOMEPAGE="http://gnomefiles.org/content/show.php/X2?content=145463"
SRC_URI="http://gnomefiles.org/CONTENT/content-files/145463-${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="x11-libs/gtksourceview:2.0
	x11-libs/vte:0"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare(){
	epatch "${FILESDIR}/${P}-desktop.patch"
	epatch "${FILESDIR}/${P}-Makefile.patch"
	tc-export CC
}
