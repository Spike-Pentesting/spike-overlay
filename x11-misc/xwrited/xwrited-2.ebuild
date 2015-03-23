# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

if [[ ${PV} == "9999" ]]; then
	inherit mercurial
	EHG_REPO_URI="https://hg.guido-berhoerster.org/projects/xwrited/"
else
	SRC_URI="https://code.guido-berhoerster.org/projects/xwrited/downloads/${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="an utility displays write(1) and wall(1) messages as desktop notifications"
HOMEPAGE="https://code.guido-berhoerster.org/projects/xwrited/"
LICENSE="MIT"
SLOT="2"

DEPEND="sys-libs/libutempter
	>=dev-libs/glib-2.26
	dev-libs/dbus-glib
	>=sys-devel/gcc-3.81
	>=dev-ruby/libxml-2"
RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}" install
	dodoc README NEWS
}

