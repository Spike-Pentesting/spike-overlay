# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-2


DESCRIPTION="a tool for generating freedesktop-compliant menus for Spike distribution"
HOMEPAGE="https://code.google.com/p/pentoo/source/browse"
EGIT_REPO_URI="http://dev.dark-lab.net/spike/genmenu.git"
EGIT_COMMIT="v${PV}"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
DEPEND=">=dev-python/lxml-1.3.6
	gnome-base/gnome-menus"
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/share/
	doins -r "${S}"/src/share/genmenu
	chown -R root:root "${D}"
	dobin src/bin/genmenu.py src/bin/launch
}

pkg_postinst() {
	einfo
	einfo "The genmenu has been updated."
	einfo "You should run the following command to regenerate the main Spike menu:"
	einfo "E17:  sudo genmenu.py -e"
	einfo "Xfce: genmenu.py -x"
	einfo "KDE:  genmenu.py -k"
	einfo
	einfo "See -h for more options"
}
