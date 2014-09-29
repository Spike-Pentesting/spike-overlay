# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils git-2 versionator

DESCRIPTION="Library for providing a basic file input/output abstraction layer"
HOMEPAGE="https://code.google.com/p/libbfio/"
EGIT_REPO_URI="https://code.google.com/p/libbfio/"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS=""
IUSE="unicode"

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

src_configure() {
	econf $(use_enable unicode wide-character-type)
}

src_install() {
	emake install DESTDIR="${D}" || die "Failed to install"
}
