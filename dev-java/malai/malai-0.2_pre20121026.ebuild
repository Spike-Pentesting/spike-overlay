# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

JAVA_PKG_IUSE="doc source"

inherit eutils java-pkg-2 java-ant-2 vcs-snapshot

DESCRIPTION="An implementation of the Malai pattern"
HOMEPAGE="https://launchpad.net/malai"
COMMIT="f65e7c4e32239e2d34e2379e135fac1d1f3f051e"
SRC_URI="http://github.com/arnobl/Malai/tarball/${COMMIT} -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=virtual/jdk-1.6"
RDEPEND=">=virtual/jre-1.6"

EANT_DOC_TARGET="doc"
java_prepare() {
	epatch "${FILESDIR}"/${PN}-build.xml.patch
}

src_install() {
	use doc && java-pkg_dojavadoc doc
	use source && java-pkg_dosrc src/{net,org}
	java-pkg_dojar out/${PN}.jar
}
