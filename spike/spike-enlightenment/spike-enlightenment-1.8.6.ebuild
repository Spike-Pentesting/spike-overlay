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
	x11-wm/enlightenment
	x11-terms/terminology
	dev-libs/efl
	media-libs/elementary
	media-libs/imlib2
"
RDEPEND="${DEPEND}"
pkg_install(){
einfo "Meta ebuild for enlightenment"
}
