# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MY_AUTHOR="snwh"
DESCRIPTION="the Paper gtk theme by snwh"
HOMEPAGE="https://github.com/${MY_AUTHOR}/${PN}"

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	SRC_URI=""
	EGIT_REPO_URI="https://github.com/${MY_AUTHOR}/${PN}.git"
	KEYWORDS=""
else
	inherit git-r3
	SRC_URI=""
	EGIT_REPO_URI="https://github.com/${MY_AUTHOR}/${PN}.git"
	EGIT_COMMIT="3aa17ec9117f5c4a99e8031ea20f0d2b5804af87"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3"
SLOT="0"

DEPEND=">=gnome-base/gnome-shell-3.12
	gnome-extra/gnome-shell-extensions
	x11-libs/gdk-pixbuf"
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/share/themes/
	doins -r Paper
	dodoc README.md
}
