# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit autotools eutils

DESCRIPTION="a 3D graph drawing package"
HOMEPAGE="http://functy.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.0-src.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="sci-libs/symbolic
	x11-libs/gtk+:2
	x11-libs/gdk-pixbuf:2
	x11-libs/gtkglext
	dev-libs/libzip
	media-libs/libpng
	media-libs/glee"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}

src_install() {
	DESTDIR="${D}" emake install
}

