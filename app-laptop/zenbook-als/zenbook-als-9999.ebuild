# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit qmake-utils

if [[ "${PV}" = "9999" ]]; then
	inherit git-2
	EGIT_REPO_URI="git://github.com/danieleds/Asus-Zenbook-Ambient-Light-Sensor-Controller.git"
	KEYWORDS=""
else
	COMMIT_ID="ba447bc47271dbf69ac4a4bad11cfadc04df69c3"
	SRC_URI="https://github.com/danieleds/Asus-Zenbook-Ambient-Light-Sensor-Controller/archive/${COMMIT_ID}.tar.gz -> ${P}-git.tar.gz"
	KEYWORDS="~amd64"
	S=${WORKDIR}/Asus-Zenbook-Ambient-Light-Sensor-Controller-${COMMIT_ID}
fi

DESCRIPTION="ASUS Zenbook Ambient Light Sensor Controller"
HOMEPAGE="http://github.com/victorenator/als"

LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

DEPEND="dev-libs/libbsd"
RDEPEND="${DEPEND}
	app-laptop/zenbook-als-module"

src_configure() {
	eqmake4 service/als-controller.pro
}

src_install() {
	newinitd "${FILESDIR}"/${PN}.initd als-controller
	dodoc README.md
	dosbin als-controller
}
