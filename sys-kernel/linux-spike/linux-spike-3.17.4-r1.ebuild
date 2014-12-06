# Copyright 2004-2014 Spike Linux
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit versionator

K_SPIKEKERNEL_SELF_TARBALL_NAME="spike"
K_REQUIRED_LINUX_FIRMWARE_VER="20140603"
K_SPIKEKERNEL_FORCE_SUBLEVEL="0"
K_SPIKEKERNEL_PATCH_UPSTREAM_TARBALL="1"
K_KERNEL_NEW_VERSIONING="1"

inherit spike-kernel

KEYWORDS="~amd64 ~x86"
DESCRIPTION="Official Spike Linux Standard kernel image"
RESTRICT="mirror"

DEPEND="${DEPEND}
    sys-apps/v86d"
