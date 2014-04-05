# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: 

EAPI=4

inherit cmake-utils eutils multilib git-2
EGIT_REPO_URI="git://git.code.sf.net/p/be-shell/code"
EGIT_PROJECT="be-shell"

DESCRIPTION="BE::Shell is a simple desktop shell on KDE technology (namely KIO and Solid) for the rest of us."
HOMEPAGE="http://sourceforge.net/p/be-shell/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="
	x11-libs/qt-gui
	kde-base/kdelibs
	x11-libs/qt-core
	media-libs/phonon
	x11-libs/qt-gui
	x11-libs/qt-dbus
	"

DEPEND="${RDEPEND}"

