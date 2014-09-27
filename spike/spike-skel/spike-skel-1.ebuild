# Copyright 1999-2014 Gentoo
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
EGIT_COMMIT="${PVR}"
EGIT_REPO_URI="git://github.com/Spike-Pentesting/skel.git"

inherit eutils git-2 fdo-mime

DESCRIPTION="Spike Linux skel tree"
HOMEPAGE="http://www.spike-pentesting.org"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""
RDEPEND=""

src_install () {
	dodir /etc/xdg/menus
	cp "${S}"/* "${D}"/etc/ -Ra

	# Spike Menu
	dodir /usr/share/desktop-directories
	cp "${FILESDIR}"/1/directory/*.directory "${D}"/usr/share/desktop-directories/
	dodir /usr/share/spike
	cp -a "${FILESDIR}"/1/* "${D}"/usr/share/spike/
	#doicon "${FILESDIR}"/1/pixmaps/sabayon-weblink.png
	chown root:root "${D}"/etc/skel -R
}

pkg_postinst () {
	if [ -x "/usr/bin/xdg-desktop-menu" ]; then
		# Manual install otherwise it wont be set up correctly, it's ugly, but i won't print all the menu installs in the ebuild
		bash "${FILESDIR}"/menu.sh
	fi

	fdo-mime_desktop_database_update
}

pkg_prerm() {
	if [ -x "/usr/bin/xdg-desktop-menu" ]; then
		xdg-desktop-menu uninstall /usr/share/spike/directory/*.directory /usr/share/spike/desktop/*.desktop
	fi
}
