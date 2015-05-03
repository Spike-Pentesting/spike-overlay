# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils java-utils-2

MY_PN="LaTeXDraw"
MY_P=${MY_PN}-${PV}
DESCRIPTION="Graphical drawing editor for latex"
HOMEPAGE="http://latexdraw.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN/-bin}/${MY_P}-bin.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="!dev-tex/latexdraw
	>=virtual/jre-1.7"
DEPEND="app-arch/unzip"

S=${WORKDIR}/${MY_P}

src_install() {
	dodoc readme.txt release_note.txt history.txt
	cd data || die
	insinto /usr/share/${PN/-bin}
	doins -r templates

	insinto /opt/${PN/-bin}
	doins -r lib
	java-pkg_jarinto /opt/${PN/-bin}
	java-pkg_dojar ${MY_PN}.jar
	java-pkg_dolauncher ${PN/-bin} --main net.sf.${PN/-bin}.${MY_PN} --jar /opt/${PN/-bin}/${MY_PN}.jar
}
