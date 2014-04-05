# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils python distutils subversion

DESCRIPTION="Testing tool for the identification of vulnerabilities in web applications"
HOMEPAGE="http://code.google.com/p/raft/"
ESVN_REPO_URI="http://raft.googlecode.com/svn/trunk/"
MY_DIR="/usr/share/${PN}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-python/qscintilla-python-2.5.1
	>=dev-python/PyQt4-4.9.1
	>=dev-python/lxml-2.3 "
RDEPEND="${DEPEND}"

src_compile() {
	distutils_src_compile
}

src_install() {
	distutils_src_install
	dodir "${MY_DIR}"
	cp -p -R "${S}"/* "${ED}"${MY_DIR} || die "Install failed!"
	rm -rfv "${ED}"${MY_DIR}/setup.py "${ED}"${MY_DIR}/README "${ED}"${MY_DIR}/COPYING || die "Removing of useless file failed"
	dosym "${ED}"${MY_DIR}/raft.pyw /usr/bin/raft
}
