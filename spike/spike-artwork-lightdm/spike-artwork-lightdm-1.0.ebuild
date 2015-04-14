# Copyright 1999-2015 Gentoo
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

DESCRIPTION="Spike Linux lightdm artwork"
HOMEPAGE="http://www.spike-pentesting.org"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""
RDEPEND=""

src_install () {
	cp -a "${FILESDIR}"/lightdm-gtk-greeter.conf "${D}"/etc/lightdm/lightdm-gtk-greeter.conf
}