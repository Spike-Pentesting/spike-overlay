# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4

EGIT_BOOTSTRAP="bootstrap"
EGIT_REPO_URI="https://github.com/iveney/pwntcha.git"
EGIT_BRANCH="master"
[[ "${PV}" == "9999" ]] && inherit git-2

DESCRIPTION="An efficient Captcha Decoder."
HOMEPAGE="http://caca.zoy.org/wiki/PWNtcha"
[[ "${PV}" == "9999" ]]

LICENSE="GPL-3"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

DEPEND=">=sys-devel/automake-1.6
	>=media-libs/imlib2-1.4.5
	>=media-libs/libsdl-1.2.15"


src_compile() {
	econf
	emake || die "Error: emake failed!"
}

src_install() {
	DESTDIR="${D}" emake install
}
