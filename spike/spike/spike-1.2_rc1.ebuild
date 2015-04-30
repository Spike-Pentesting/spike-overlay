# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI="5"
KEYWORDS="~amd64 ~arm ~x86"
DESCRIPTION="Spike meta-ebuild"
HOMEPAGE="http://www.spike-pentesting.org"
SLOT="0"
LICENSE="GPL-3"
IUSE=""
S="${WORKDIR}"

DEPEND="
	spike/spike-version
	spike/spike-artwork-core
	spike/spike-artwork-grub
	spike/spike-artwork-isolinux
	spike/spike-skel
	!x11-themes/sabayon-artwork-core
	!x11-themes/sabayon-artwork-grub
	!x11-themes/sabayon-artwork-isolinux
	!x11-themes/sabayon-artwork-extra
	!app-misc/sabayon-skel
	!app-misc/sabayon-version
"
#net-wireless/ska e net-wireless/afrag net-fs/winexe net-wireless/mfoc removed
RDEPEND="${DEPEND}"
