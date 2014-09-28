# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit python eutils

DESCRIPTION="Haccess the web in a LAN without internet connection but with access to an E-mail system only"
HOMEPAGE="http://www.edge-security.com/hosproxy.php"
SLOT="1.0"

MY_D="/usr/share/hosProxy"
KEYWORDS="~amd64 ~x86"
SRC_URI="http://www.edge-security.com/soft/hosProxy-${PV}.tar.gz"

LICENSE="GPL-2"
IUSE=""

RDEPEND="dev-python/pyopenssl
	 dev-python/pycurl"
DEPEND="${RDEPEND}"

S="${WORKDIR}/hosProxy"

src_prepare() {
	 cd "${S}/HoSProxy/"
	 epatch "${FILESDIR}/HoSProxy.py.patch"
	 cd "${S}/ExternalServer/"
	 epatch "${FILESDIR}/HoStunnel.py.patch"
}

src_install() {
	 dodir "${MY_D}"
	 dodir "${MY_D}/client"
	 dodir "${MY_D}/server"
	 insinto "${MY_D}/client"
	 insopts -m0755
	 doins "${S}/HoSProxy/"*.py || die "Install Failed"
	 doins "${S}/HoSProxy/"server.pem || die "Installation of pem file failed"
	 insinto "/etc"
	 insopts -m0644
	 doins "${S}/HoSProxy/"hosproxy.cfg || die "Installation of cfg file failed"
	 insinto "${MY_D}/server"
	 insopts -m0755
	 doins "${S}/ExternalServer/"*.py || die "Install Failed"
	 dosym "${MY_D}/client"/HoSProxy.py /usr/bin/hosproxy-client
	 dosym "${MY_D}/server"/HoStunnel.py /usr/sbin/hosproxy-server
	 dodoc README.txt
}
