# Copyright 1999-2014 Spike Linux
# Distributed under the terms of the GNU General Public License v2
#

EAPI=4
CMAKE_REQUIRED="never"
inherit eutils kde4-base

DESCRIPTION="Spike Linux Official KDE Artwork"
HOMEPAGE="http://www.spike-pentesting.org/"
SRC_URI="mirror://spike/${CATEGORY}/${PN}/${PN}-${PVR}.tar.xz"
LICENSE="CCPL-Attribution-ShareAlike-3.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="+ksplash"
RDEPEND=""

S="${WORKDIR}/${PN}"

src_install() {
	# KDM
	dodir "${KDEDIR}"/share/apps/kdm/themes
	cd ${S}/kdm
	insinto "${KDEDIR}"/share/apps/kdm/themes
	doins -r ./

	# Kwin
	dodir "${KDEDIR}"/share/apps/aurorae/themes/
	cd ${S}/kwin
	insinto "${KDEDIR}"/share/apps/aurorae/themes/
	doins -r ./

	# KSplash
	if use ksplash; then
		dodir "${KDEDIR}"/share/apps/ksplash/Themes
		cd "${S}"/ksplash
		insinto "${KDEDIR}"/share/apps/ksplash/Themes
		doins -r ./
	fi
}
