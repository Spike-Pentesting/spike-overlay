# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils git-2 versionator

MY_DATE="$(get_version_component_range 3)"

DESCRIPTION="Library for accessing Personal Folder Files."
HOMEPAGE="http://code.google.com/p/libpff/"
EGIT_REPO_URI="https://code.google.com/p/libpff/"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="app-forensics/libbfio"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

src_install() {
	emake install DESTDIR="${D}" || die "Failed to install"
}
