# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

E_PKG_IUSE="doc nls"

EFL_USE_GIT="yes"
EFL_GIT_REPO_CATEGORY="core"

inherit efl

DESCRIPTION="Basic widget set, based on EFL with focus mobile touch-screen devices."
HOMEPAGE="http://trac.enlightenment.org/e/wiki/Elementary"

LICENSE="LGPL-2.1"

IUSE="emap fbcon location opengl quicklaunch sdl static-libs thumbnails video wayland weather X xcb xdg"

RDEPEND="
	>=dev-libs/efl-9999[fbcon?,opengl?,sdl?,wayland?,X?,xcb?]
	location? ( >=dev-libs/elocation-9999 )
	emap? ( >=sci-geosciences/emap-9999 )
	weather? ( >=net-libs/libeweather-9999 )
	"
DEPEND="${RDEPEND}"

src_configure() {
	export MY_ECONF="
	  ${MY_ECONF}
	  $(use_enable emap emap)
	  $(use_enable location elocation)
	  $(use_enable xdg efreet)
	  $(use_enable weather eweather)
	  $(use_enable fbcon ecore-fb)
	  $(use_enable sdl ecore-sdl)
	  $(use_enable wayland ecore-wayland)
	  $(use_enable X ecore-x)
	  $(use_enable thumbnails ethumb)
	  $(use_enable video emotion)
	  $(use_enable quicklaunch quick-launch)
	  --with-elementary-web-backend=none
	  --disable-build-examples
	"
	efl_src_configure
}
