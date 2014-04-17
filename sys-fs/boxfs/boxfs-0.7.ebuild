# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=4
inherit eutils
DESCRIPTION="A FUSE filesystem to access files on your box.net account"
HOMEPAGE="http://code.google.com/p/boxfs/"
SRC_URI="http://boxfs.googlecode.com/files/${P}.tgz"
KEYWORDS="~amd64 ~x86"
MY_PV=${PV/\./_}
LICENSE="GPL-2"
SLOT="0.7"
DEPEND="sys-fs/fuse
dev-libs/libxml2
dev-libs/libzip
dev-libs/libapp
net-misc/curl"
RDEPEND="${DEPEND}"
src_install() {
dobin boxfs
}
