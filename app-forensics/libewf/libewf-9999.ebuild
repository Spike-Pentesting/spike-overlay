# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils git-2 versionator

DESCRIPTION="Implementation of the EWF (SMART and EnCase) image format"
HOMEPAGE="https://code.google.com/p/libewf/"
EGIT_REPO_URI="https://code.google.com/p/libewf/"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE="debug python rawio unicode"

DEPEND="sys-libs/e2fsprogs-libs
	app-forensics/libbfio
	sys-libs/zlib
	dev-libs/openssl"
RDEPEND="${DEPEND}"

src_configure() {
	econf \
		$(use_enable unicode wide-character-type) \
		$(use_enable rawio low-level-functions) \
		$(use_enable debug verbose-output) \
		$(use_enable debug debug-output) \
		$(use_enable python)
}

src_install() {
	emake install DESTDIR="${D}"
	dodoc AUTHORS ChangeLog NEWS README documents/*.txt
	doman manuals/*.1 manuals/*.3
}
