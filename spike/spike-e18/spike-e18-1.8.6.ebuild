# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI="3"
KEYWORDS="~amd64 ~x86"
DESCRIPTION="Spike meta-ebuild for e18 flavour"
HOMEPAGE="http://www.spikepentesting.org"
SLOT="0"
LICENSE="GPL"
IUSE=""

S="${WORKDIR}"

DEPEND="
	x11-wm/enlightenment
	dev-libs/e_dbus
	x11-terms/terminology
	dev-libs/efl
	media-libs/elementary
	x11-misc/econnman
	x11-misc/emprint
	x11-misc/entrance
	x11-misc/eruler
	x11-misc/shellementary
	media-gfx/ephoto
	media-gfx/exquisite
	media-libs/imlib2
	media-libs/imlib2_loaders
	media-plugins/evas_generic_loaders
	media-sound/enjoy
	media-sound/g72x++
	media-video/espionnage
	media-video/rage
	games-arcade/e_cho
	games-puzzle/econcentration
	games-puzzle/elemines
	x11-plugins/e_modules-alarm
	x11-plugins/e_modules-calendar
	x11-plugins/e_modules-cpu
	x11-plugins/e_modules-deskshow
	x11-plugins/e_modules-diskio
	x11-plugins/e_modules-eektool
	x11-plugins/e_modules-eenvader_fractal
	x11-plugins/e_modules-elfe
	x11-plugins/e_modules-eooorg
	x11-plugins/e_modules-everything-places
	x11-plugins/e_modules-everything-wallpaper
	x11-plugins/e_modules-everything-websearch
	x11-plugins/e_modules-eweather
	x11-plugins/e_modules-execwatch
	x11-plugins/e_modules-flame
	x11-plugins/e_modules-forecasts
	x11-plugins/e_modules-iiirk
	x11-plugins/e_modules-mail
	x11-plugins/e_modules-mem
	x11-plugins/e_modules-moon
	x11-plugins/e_modules-mpdule
	x11-plugins/e_modules-net
	x11-plugins/e_modules-news
	x11-plugins/e_modules-places
	x11-plugins/e_modules-rain
	x11-plugins/e_modules-rmb
	x11-plugins/e_modules-screenshot
	x11-plugins/e_modules-slideshow
	x11-plugins/e_modules-snow
	x11-plugins/e_modules-taskbar
	x11-plugins/e_modules-tclock
	x11-plugins/e_modules-uptime
	x11-plugins/e_modules-weather
	x11-plugins/e_modules-winselector
	x11-plugins/e_modules-wlan
	x11-plugins/echievements
	x11-plugins/edgar
	x11-plugins/eplanet
	x11-plugins/extramenu
	x11-plugins/trash
	x11-themes/23oz
	x11-themes/blingbling
	x11-themes/darkness
	x11-themes/detour-elm
	x11-themes/detourious
"
RDEPEND="${DEPEND}"
pkg_install(){
einfo "Meta ebuild for e18"
}
