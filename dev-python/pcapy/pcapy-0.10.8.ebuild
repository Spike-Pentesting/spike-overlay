# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 python3_3 python3_4 )

inherit distutils

RDEPEND="${DEPEND}
	 net-libs/libpcap"

DESCRIPTION="Python pcap extension"
HOMEPAGE="http://oss.coresecurity.com/projects/pcapy.html"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz
	http://oss.coresecurity.com/repo/${P}.tar.gz"

LICENSE="Apache-1.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
