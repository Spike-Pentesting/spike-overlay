# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: 

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7} )
inherit distutils-r1

DESCRIPTION="The BitTorrent bencode module as light-weight, standalone package."
HOMEPAGE="http://bittorrent.com"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BitTorrent"
SLOT="0"
KEYWORDS="~amd64 ~x86"
