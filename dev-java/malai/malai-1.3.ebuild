# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils java-pkg-2 java-ant-2 unpacker

DESCRIPTION="An implementation of the Malai pattern"
HOMEPAGE="https://launchpad.net/malai"
SRC_URI="https://launchpad.net/${PN}/1.0/${PV}/+download/${P}-src.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=virtual/jdk-1.6"
RDEPEND=">=virtual/jre-1.6"

S=${WORKDIR}

src_unpack() {
	default
	unpack_zip malai.core-${PV}-src.zip
	unpack_zip malai.swing-${PV}-src.zip
}

java_prepare() {
	epatch -p1 "${FILESDIR}"/${P}-build.xml.patch
}

src_compile() {
	EANT_BUILD_XML="malai.core-${PV}/build.xml" java-pkg-2_src_compile
	EANT_BUILD_XML="malai.swing-${PV}/build.xml" java-pkg-2_src_compile
}

src_install() {
	java-pkg_newjar malai.core-${PV}/target/malai.core-${PV}.jar malai.core.jar
	java-pkg_newjar malai.swing-${PV}/target/malai.swing-${PV}.jar malai.swing.jar
}
