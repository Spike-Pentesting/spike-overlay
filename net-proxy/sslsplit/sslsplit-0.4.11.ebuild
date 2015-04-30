# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit linux-info

DESCRIPTION="Transparent and scalable SSL/TLS interception"
HOMEPAGE="http://www.roe.ch/SSLsplit"
SRC_URI="https://github.com/droe/sslsplit/archive/${PV}.tar.gz -> 
${P}.tar.gz"

LICENSE="BSD MIT APSL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	>=dev-libs/libevent-2.0
	dev-libs/openssl"

DEPEND="${RDEPEND}"

pkg_pretend() {
	CONFIG_CHECK="
		~IP_NF_TARGET_REDIRECT
		~NETFILTER_XT_TARGET_REDIRECT
		~NETFILTER_XT_TARGET_TPROXY"

	check_extra_config
}

src_compile() {
	FEATURES="" emake
}

src_test() {
	FEATURES="" emake test
}

src_install() {
	FEATURES="" emake install PREFIX="/usr" DESTDIR="${D}"
}
