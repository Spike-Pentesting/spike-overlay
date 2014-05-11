# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI="3"
KEYWORDS="~amd64 ~x86"
DESCRIPTION="Spike meta-ebuild for enlightenment flavour"
HOMEPAGE="http://www.spikepentesting.org"
SLOT="0"
LICENSE="GPL"
IUSE=""

S="${WORKDIR}"

DEPEND="
	<x11-wm/enlightenment-9999
	<x11-terms/terminology-9999
	<dev-libs/efl-9999
	<media-libs/elementary-9999
	<media-libs/imlib2-9999
"
RDEPEND="${DEPEND}"
pkg_install(){
einfo "Meta ebuild for enlightenment"
}
