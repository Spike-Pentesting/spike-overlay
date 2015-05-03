# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit vcs-snapshot

COMMIT_ID="20d941d63aef95da0ff1c5bdae6e9773fbe3c396"
DESCRIPTION="PDF presentation tool"
HOMEPAGE="https://github.com/TrilbyWhite/Slider"
SRC_URI="https://github.com/TrilbyWhite/Slider/archive/${COMMIT_ID}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="app-text/poppler:=
	media-libs/freetype
	x11-libs/cairo
	x11-libs/libX11
	x11-libs/libXinerama"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_install() {
	default
	doman doc/slider.1
}
