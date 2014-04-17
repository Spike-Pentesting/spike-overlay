EAPI="2"

inherit cmake-utils

MY_PV="${PV/_rc/rc}"
MY_P="${PN}-${MY_PV}"

DESCRIPTION="Peer-to-peer VPN software"
HOMEPAGE="http://code.google.com/p/badvpn/"
SRC_URI="http://badvpn.googlecode.com/files/${MY_P}.tar.bz2"

LICENSE="GPL-2"
KEYWORDS="amd64 arm x86"
SLOT="26"
IUSE="debug +ncd"

RDEPEND="dev-libs/nss
	dev-libs/openssl
	ncd? (
		sys-apps/iproute2
		net-firewall/iptables
	)
"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${MY_P}"

src_install() {
	cmake-utils_src_install

	if use ncd; then
		newinitd "${FILESDIR}/${PN}-ncd.init" "${PN}-ncd"
		newconfd "${FILESDIR}/${PN}-ncd.conf" "${PN}-ncd"
	else
		rm "${D}/usr/bin/${PN}-ncd"
	fi
}
