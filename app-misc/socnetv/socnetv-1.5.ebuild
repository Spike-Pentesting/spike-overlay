# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-misc/socnetv/socnetv-0.90.ebuild,v 1.4 2013/03/02 19:31:48 hwoarang Exp $

EAPI="5"

inherit eutils toolchain-funcs qmake-utils git-r3

DESCRIPTION="Qt Social Network Visualizer"
HOMEPAGE="http://socnetv.sourceforge.net/"
EGIT_REPO_URI="git://git.code.sf.net/p/socnetv/git"

LICENSE="GPL-2"
SLOT="0"
if ! [[ ${PV} == 9999* ]]; then
	KEYWORDS="~amd64"
	EGIT_COMMIT="v${PV}"
else
	KEYWORDS=""
fi
IUSE="doc"

DEPEND="dev-qt/qtgui:5
	dev-qt/qtwebkit:5"
RDEPEND="${DEPEND}"

src_prepare() {
	eqmake5
}

src_compile() {
	emake CXX="$(tc-getCXX)" CXXFLAGS="${LDFLAGS} ${CXXFLAGS}" \
		LFLAGS="${LDFLAGS}"
}

src_install() {
	dobin socnetv
	doicon src/images/socnetv.png
	make_desktop_entry  ${PN} SocNetV ${PN} 'Science'
	insinto /usr/share/${PN}/examples
	doins nets/*
	dodoc AUTHORS ChangeLog README TODO
	if use doc; then
		dohtml -r "${S}"/manual/*
	fi
	doman "${S}/man/${PN}.1.gz"
}
