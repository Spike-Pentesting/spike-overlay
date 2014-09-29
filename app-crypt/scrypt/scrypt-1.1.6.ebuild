# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils

DESCRIPTION="Encrypt and decrypt files using Colin Percival's scrypt algorithm"
HOMEPAGE="http://www.tarsnap.com/scrypt.html"
SRC_URI="http://www.tarsnap.com/scrypt/${P}.tgz"
LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~x86"

IUSE="sse2"
DEPEND="dev-libs/openssl"
RDEPEND="${DEPEND}"

src_configure() {
	econf \
		$(use_enable sse2)
}

src_install() {
	emake DESTDIR="${D}" install
	dodoc FORMAT
}
