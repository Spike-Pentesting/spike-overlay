# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit font

MY_PN="Font-Awesome"
DESCRIPTION="The iconic font designed for use with Twitter Bootstrap"
HOMEPAGE="http://fortawesome.github.com/Font-Awesome"
SRC_URI="https://github.com/FortAwesome/${MY_PN}/archive/v${PV}.tar.gz ->
${P}.tar.gz"

LICENSE="OFL-1.1 CC-BY-3.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND=""

S="${WORKDIR}"/${MY_PN}-${PV}
FONT_SUFFIX="ttf otf"
FONT_S="${S}"/font
