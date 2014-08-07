# Copyright 2004-2013 Sabayon Linux
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit versionator

K_SABKERNEL_SELF_TARBALL_NAME="sabayon"
K_REQUIRED_LINUX_FIRMWARE_VER="20131230"
K_SABKERNEL_FORCE_SUBLEVEL="0"
K_SABKERNEL_PATCH_UPSTREAM_TARBALL="1"
K_KERNEL_NEW_VERSIONING="1"
K_KERNEL_PATCH_HOTFIXES="${FILESDIR}/001-acs_override.patch ${FILESDIR}/002-i915_vga_arbiter_fix.patch ${FILESDIR}/003-vgaarb.patch ${FILESDIR}/99_config_vfio.patch"

inherit sabayon-kernel

KEYWORDS="~amd64 ~x86"
DESCRIPTION="Unofficial Sabayon Linux Standard kernel image, with vga arbiter patches"
RESTRICT="mirror"

DEPEND="${DEPEND}
sys-apps/v86d"