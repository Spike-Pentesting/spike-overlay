# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils git-2

DESCRIPTION="wifi rogue AP attacks and MitM"
HOMEPAGE="https://github.com/sensepost/mana"
EGIT_HAS_SUBMODULES=1
EGIT_COMMIT="0b2aad2140485f48dcd57ed2662084629671f255"
EGIT_REPO_URI="git://github.com/sensepost/mana.git"

LICENSE="CC-BY-SA-4.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="
	net-analyzer/dsniff
	net-misc/stunnel
	dev-libs/libnl
	net-proxy/sslsplit
	net-analyzer/scapy
	net-analyzer/metasploit
	net-misc/dhcpcd
	net-proxy/tinyproxy
	dev-python/dnspython
	dev-libs/openssl
	net-analyzer/macchanger
	www-servers/apache
"

RDEPEND="${DEPEND}"

