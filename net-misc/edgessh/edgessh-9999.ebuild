# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit python eutils subversion

DESCRIPTION="SSH cracking tools"
HOMEPAGE="http://www.edge-security.com/edgessh.php"
SLOT="9999"

MY_D="/usr/share/${PN}"
KEYWORDS="~amd64 ~x86"
ESVN_REPO_URI="http://edgessh.googlecode.com/svn/trunk/"

LICENSE="GPL-3"
IUSE=""

RDEPEND=">=dev-python/paramiko-1.7.7.1"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN}"

src_prepare() {
         cd "${S}"
         epatch "${FILESDIR}/brutessh.patch"
         epatch "${FILESDIR}/scanssh.patch"
}

src_install() {
	 dodir "${MY_D}"
	 insinto "${MY_D}"
	 insopts -m0755
	 doins "${S}"/scanssh.py || die "Install Failed"
	 doins "${S}"/brutessh.py || die "Install Failed"
	 doins "${S}"/terminal.py || die "Install Failed"
	 dosym "${MY_D}"/scanssh.py /usr/bin/scanssh
	 dosym "${MY_D}"/brutessh.py /usr/bin/brutessh
	 dodoc README
}
