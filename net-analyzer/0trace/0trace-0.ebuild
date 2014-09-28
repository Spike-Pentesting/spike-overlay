# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit eutils
DESCRIPTION="0trace.sh is a reconnaissance / firewall bypassing tool that enables hop enumeration"
HOMEPAGE="http://jon.oberheide.org/0trace/"
SRC_URI="http://jon.oberheide.org/0trace/downloads/$PN.py"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="gnome X"
DEPEND=">=dev-python/dpkt-1.7
		>=dev-python/pypcap-1.1-r1
		>=dev-libs/libdnet-1.11-r1"
RDEPEND="${DEPEND}"
S="${DISTDIR}"
src_install() {
	mkdir -p "${D}"/usr/bin/
	cp "{P}".py "${D}"/usr/bin/
	chmod +x  "${D}"/usr/bin/"${P}".py
}