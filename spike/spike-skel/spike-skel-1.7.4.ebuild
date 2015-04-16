# Copyright 1999-2014 Gentoo
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
EGIT_COMMIT="${PVR}"
EGIT_REPO_URI="git://github.com/Spike-Pentesting/skel.git"

inherit eutils git-2

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
	chown root:root "${D}"/etc/skel -R
}

