# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools
if [ "${PV}" = "9999" ]; then
	EGIT_REPO_URI="https://github.com/linux-sunxi/libump"
	inherit git-r3
	KEYWORDS=""
else
	COMMIT_ID="ec0680628744f30b8fac35e41a7bd8e23e59c39f"
	SRC_URI="https://github.com/linux-sunxi/${PN}/archive/${COMMIT_ID}.tar.gz -> ${P}-git.tar.gz"
	KEYWORDS="~amd64 ~arm"
	IUSE=""
	S=${WORKDIR}/${PN}-${COMMIT_ID}
fi

DESCRIPTION="Universal memory provider userspace library"
HOMEPAGE="https://github.com/linux-sunxi/libump"

LICENSE="Apache-2.0"
SLOT="0"

DEPEND="virtual/pkgconfig"

src_prepare() {
	eautoreconf
}
