# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Sabayon Official Calamares branding"
HOMEPAGE="http://www.sabayon.org/"
SRC_URI="mirror://spike/${CATEGORY}/${PN}/${PN}-${PVR}.tar.xz"
LICENSE="CC-BY-SA-4.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=app-admin/calamares-1.0"
RDEPEND="${DEPEND}"

src_install() {
	insinto "/etc/calamares/"
	doins -r "${S}/"*
}