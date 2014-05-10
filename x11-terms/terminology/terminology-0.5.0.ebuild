# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

EFL_USE_GIT="yes"
EFL_GIT_REPO_CATEGORY="apps"
EGIT_COMMIT="v${PV}"
KEYWORDS="~amd64 ~x86"

inherit efl

DESCRIPTION="EFL based terminal emulator"
HOMEPAGE="http://www.enlightenment.org/p.php?p=about/terminology"

IUSE=""

RDEPEND="
	dev-libs/efl
	media-libs/elementary"

DEPEND="${RDEPEND}"
