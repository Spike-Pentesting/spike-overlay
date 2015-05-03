# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit linux-mod

if [[ "${PV}" = "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="git://github.com/danieleds/als.git"
	KEYWORDS=""
else
	COMMIT_ID="150684d1b73e1405609502e1166ba878c42dbb18"
	SRC_URI="https://github.com/danieleds/als/archive/${COMMIT_ID}.tar.gz -> ${P}-git.tar.gz"
	KEYWORDS="~amd64"
	S=${WORKDIR}/als-${COMMIT_ID}
fi

DESCRIPTION="A kernel module for the ASUS Zenbook Ambient Light Sensor Driver"
HOMEPAGE="http://github.com/danieleds/als"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

MODULE_NAMES="als(misc:${S})"
BUILD_TARGETS="all"

src_compile(){
	BUILD_PARAMS="KDIR=${KV_OUT_DIR} M=${S}"
	linux-mod_src_compile
}
