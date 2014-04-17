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
IUSE="debug +badvpn +ncd +tun2socks +udpgw"

RDEPEND="
	badvpn? ( dev-libs/openssl )
	ncd? ( dev-libs/openssl )
	badvpn? ( dev-libs/nss )
	ncd? (
		>=sys-fs/udev-171
		sys-apps/iproute2
		net-firewall/iptables
		net-wireless/wpa_supplicant
	)
"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${MY_P}"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_build badvpn CLIENT)
		$(cmake-utils_use_build badvpn SERVER)
		$(cmake-utils_use_build badvpn FLOODER)
		$(cmake-utils_use_build ncd NCD)
		$(cmake-utils_use_build tun2socks TUN2SOCKS)
		$(cmake-utils_use_build udpgw UDPGW)
	)

	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install

	if use ncd; then
		newinitd "${FILESDIR}/${PN}-ncd.init" "${PN}-ncd"
		newconfd "${FILESDIR}/${PN}-ncd.conf" "${PN}-ncd"
	fi
}
