# Copyright 2013-2015 Spike
# Distributed under the terms of the GNU General Public License v2

EAPI=5

EGIT_REPO_URI="git://github.com/Spike-Pentesting/spike-live.git"
EGIT_COMMIT="${PV}"

inherit eutils systemd git-2

DESCRIPTION="Spike Pentesting live image scripts and tools"
HOMEPAGE="http://www.spike-pentesting.org"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="amd64 arm x86"
IUSE=""

DEPEND=""
RDEPEND="!app-misc/livecd-tools
	!sys-apps/gpu-detector
	app-eselect/eselect-opengl
	dev-util/dialog
	sys-apps/gawk
	sys-apps/pciutils
	sys-apps/keyboard-configuration-helpers
	sys-apps/sed"

src_install() {
	emake DESTDIR="${D}" SYSV_INITDIR="/etc/init.d" \
		SYSTEMD_UNITDIR="$(systemd_get_unitdir)" \
		install || die
}
