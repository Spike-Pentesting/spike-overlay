# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

WX_GTK_VER="3.0"

inherit cmake-utils eutils flag-o-matic git-2 pax-utils toolchain-funcs wxwidgets games git-r3

DESCRIPTION="Free, open source emulator for Nintendo GameCube and Wii"
HOMEPAGE="http://www.dolphin-emu.com/"
EGIT_REPO_URI="https://github.com/dolphin-emu/dolphin.git"
EGIT_COMMIT="6818f2e092ee0484fce7403414ddcd6dfcc38fab"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"

# NOTES:
# - wxWidgets support relies on 2.9 branch, which is currently masked in main tree
IUSE="alsa ao bluetooth doc encode +lzo openal opengl openmp portaudio pulseaudio +wxwidgets"

RDEPEND=">=media-libs/glew-1.5
	>=media-libs/libsdl-1.2[joystick]
	media-libs/libsoundtouch
	net-libs/polarssl[havege]
	net-libs/miniupnpc
	sys-libs/readline
	x11-libs/libXext
	x11-libs/libXrandr
	ao? ( media-libs/libao )
	alsa? ( media-libs/alsa-lib )
	bluetooth? ( net-wireless/bluez )
	encode? ( media-video/libav[encode] )
	lzo? ( dev-libs/lzo )
	openal? ( media-libs/openal )
	opengl? ( virtual/opengl )
	portaudio? ( media-libs/portaudio )
	pulseaudio? ( media-sound/pulseaudio )
	wxwidgets? ( x11-libs/wxGTK:3.0 )"
DEPEND="${RDEPEND}
	sys-devel/gettext
	virtual/pkgconfig
	media-gfx/nvidia-cg-toolkit"

src_prepare() {
	append-cflags $(test-flags-CC -fpermissive)
	append-cxxflags $(test-flags-CXX -fpermissive)

	# Remove automagic dependencies
	if use !alsa; then
		sed -i -e '/^include(FindALSA/d' CMakeLists.txt || die
	fi
	if use !ao; then
		 sed -i -e '/^check_lib(AO/d' CMakeLists.txt || die
	fi
	if use !bluetooth; then
		sed -i -e '/^check_lib(BLUEZ/d' CMakeLists.txt || die
	fi
	if use !openal; then
		sed -i -e '/^include(FindOpenAL/d' CMakeLists.txt || die
	fi
	if use !portaudio; then
		sed -i -e '/CMAKE_REQUIRED_LIBRARIES portaudio/d' CMakeLists.txt || die
	fi
	if use !pulseaudio; then
		sed -i -e '/^check_lib(PULSEAUDIO/d' CMakeLists.txt || die
	fi
}

src_configure() {
	# filter problematic compiler flags
	filter-flags -flto -fwhole-program
	append-flags -fno-pie

	if $($(tc-getPKG_CONFIG) --exists nvidia-cg-toolkit); then
		append-flags "$($(tc-getPKG_CONFIG) --cflags nvidia-cg-toolkit)"
	else
		append-flags "-I/opt/nvidia-cg-toolkit/include"
	fi

	if $($(tc-getPKG_CONFIG) --exists nvidia-cg-toolkit); then
		append-ldflags "$($(tc-getPKG_CONFIG) --libs-only-L nvidia-cg-toolkit)"
	else
		append-ldflags "-L/opt/nvidia-cg-toolkit/lib"
	fi

	local mycmakeargs=(
		"-DDOLPHIN_WC_REVISION=${PV}"
		"-DCMAKE_INSTALL_PREFIX=${GAMES_PREFIX}"
		"-Dprefix=${GAMES_PREFIX}"
		"-Ddatadir=${GAMES_DATADIR}/${PN}"
		"-Dplugindir=$(games_get_libdir)/${PN}"
		$(cmake-utils_use !wxwidgets DISABLE_WX)
		$(cmake-utils_use encode ENCODE_FRAMEDUMPS)
		$(cmake-utils_use openmp OPENMP)
	)

	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install

	# set binary name
	local binary="${PN}"
	use wxwidgets || binary+="-nogui"

	# install documentation as appropriate
	dodoc Readme.md
	if use doc; then
		doins -r docs
	fi

	# create menu entry for GUI builds
	if use wxwidgets; then
		make_desktop_entry "${PN}" "Dolphin" "Dolphin" "Game;Emulator"
	fi

	prepgamesdirs
}

pkg_postinst() {
	# hardened fix
	pax-mark -m "${EPREFIX}/usr/games/bin/${PN}"

	if ! use portaudio; then
		ewarn "If you need to use your microphone for a game, rebuild with USE=portaudio"
	fi
	if ! use wxwidgets; then
		ewarn "Note: It is not currently possible to configure Dolphin without the GUI."
		ewarn "Rebuild with USE=wxwidgets to enable the GUI if needed."
	fi

	games_pkg_postinst
}
