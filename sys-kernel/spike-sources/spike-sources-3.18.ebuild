# Copyright 2004-2014 Spike Linux
# Distributed under the terms of the GNU General Public License v2

EAPI=5

K_SPIKEKERNEL_NAME="spike"
K_SPIKEKERNEL_SELF_TARBALL_NAME="spike"
K_ONLY_SOURCES="1"
K_SPIKEKERNEL_FORCE_SUBLEVEL="0"
K_KERNEL_NEW_VERSIONING="1"
K_SPIKEKERNEL_PATCH_UPSTREAM_TARBALL="1"

inherit spike-kernel

KEYWORDS="~amd64"
DESCRIPTION="Official Spike Linux Standard kernel sources"
RESTRICT="mirror"
IUSE="sources_standalone"

DEPEND="${DEPEND}
    sources_standalone? ( !=sys-kernel/linux-spike-${PVR} )
    !sources_standalone? ( =sys-kernel/linux-spike-${PVR} )"