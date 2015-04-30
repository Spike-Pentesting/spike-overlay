# Copyright 1999-2014 Spike Linux
# Distributed under the terms of the GNU General Public License v2
#

EAPI=5
inherit eutils mount-boot spike-artwork

DESCRIPTION="Official Spike Linux Core Artwork"
HOMEPAGE="http://www.spike-pentesting.org/"
SRC_URI="mirror://spike/${CATEGORY}/${PN}/${PN}-${PVR}.tar.xz"
LICENSE="CCPL-Attribution-ShareAlike-3.0"
SLOT="0"
KEYWORDS="~arm ~x86 ~amd64"
IUSE=""
RDEPEND="
	sys-apps/findutils
"
S="${WORKDIR}/${PN}"
src_install() {
	# Fbsplash theme
	cd "${S}"/fbsplash || die
	dodir /etc/splash/spike
	cp -r "${S}"/fbsplash/spike/* "${D}"/etc/splash/spike

	# Cursors
	cd "${S}"/mouse/entis/cursors || die
	dodir /usr/share/cursors/xorg-x11/entis/cursors
	insinto /usr/share/cursors/xorg-x11/entis/cursors
	doins -r ./

	# Wallpaper
	cd "${S}"/background || die
	insinto /usr/share/backgrounds
	doins *.png *.jpg
	#newins sabayonlinux.png sabayonlinux-nvidia.png

	# Plymouth
	cd "${S}/plymouth" || die
	insinto /usr/share/plymouth
	doins bizcom.png
	insinto /usr/share/plymouth/themes
	doins -r spike
}

pkg_postinst() {
	# mount boot first
	mount-boot_mount_boot_partition

	# Update Sabayon initramfs images
	update_sabayon_kernel_initramfs_splash

	einfo "Please report bugs or glitches to"
	einfo "https://spike-pentesting.org"
}
