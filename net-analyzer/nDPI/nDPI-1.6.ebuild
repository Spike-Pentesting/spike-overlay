# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

PYTHON_DEPEND="2"

inherit autotools eutils user

DESCRIPTION="an open source GPLv3 library for deep-packet inspection."
HOMEPAGE="http://www.ntop.org/"
MY_AUTHOR="ntop"
if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	SRC_URI=""
	EGIT_REPO_URI="https://github.com/${MY_AUTHOR}/${PN}.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/${MY_AUTHOR}/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND=">=sys-devel/libtool-1.5.26"
RDEPEND="net-libs/libpcap
	dev-vcs/git
	dev-libs/glib:2"

src_prepare() {
	eautoreconf
}

