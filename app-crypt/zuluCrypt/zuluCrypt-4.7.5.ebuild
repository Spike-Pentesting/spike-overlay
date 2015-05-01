# Copyright 2014 Julian Ospald <hasufell@posteo.de>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit multilib cmake-utils

DESCRIPTION="Front end to cryptsetup"
HOMEPAGE="https://github.com/mhogomchungu/zuluCrypt https://code.google.com/p/zulucrypt"
SRC_URI="https://github.com/mhogomchungu/zuluCrypt/releases/download/${PV}/zuluCrypt-${PV}.tar.bz2"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gnome +gui kde udev"

RDEPEND="
	dev-libs/libgcrypt:0
	sys-apps/util-linux
	sys-fs/cryptsetup
	gnome? ( app-crypt/libsecret )
	gui? (
		dev-libs/libpwquality
		dev-qt/qtcore:4
		dev-qt/qtgui:4
		kde? (
			kde-base/kdelibs:4
			kde-base/kwalletd:4
		)
	)
	udev? ( virtual/udev )
"
DEPEND="${RDEPEND}
	virtual/pkgconfig
"

PATCHES=(
	"${FILESDIR}"/${P}-clang.patch
)

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use udev UDEVSUPPORT)
		-DWITH_TCPLAY=FALSE
		-DLIB_SUFFIX="$(get_libdir)"
		$(cmake-utils_use !gnome NOGNOME)
		$(cmake-utils_use !gui NOGUI)
		# WITH_PWQUALITY has no effect without gui
		$(cmake-utils_use gui WITH_PWQUALITY)
		# KDE has no effect without gui
		$(usex gui "$(cmake-utils_use !kde NOKDE)" "-DNOKDE=TRUE")
	)

	cmake-utils_src_configure
}
