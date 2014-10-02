# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=4
inherit eutils multilib git-2
DESCRIPTION="libapp provides functions to easily perform some often needed operations in application development"
HOMEPAGE="https://github.com/drotiro/libapp"
EGIT_REPO_URI="https://github.com/drotiro/libapp.git"
EGIT_BRANCH="master"
LICENSE="GPL3"
SLOT="0"
KEYWORDS=""
IUSE=""
DEPEND=""
RDEPEND="${DEPEND}"
S="${WORKDIR}/${PN}"
EGIT_SOURCEDIR="${S}"
src_unpack() {
    git-2_src_unpack
    cd $S
    eaclocal
    eautoconf
}

src_install() {
	emake INSTALL_S="install" LIBDIR="\$(PREFIX)/$(get_libdir)" PREFIX="${D}/usr" install
	dodoc -r test/
}
