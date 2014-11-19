# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils

DESCRIPTION="Program to view free channels"
HOMEPAGE="http://code.google.com/p/tv-maxe"
SRC_URI="http://tv-maxe.googlecode.com/files/${PN}-${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-python/imaging
	media-video/mplayer
	media-video/vlc
	virtual/ffmpeg
	dev-python/python-virtkey
	dev-python/pygtk
	dev-lang/python
	media-tv/sopcast-player
	media-video/rtmpdump
	dev-python/sqlite3dbm
	dev-python/gst-python 
	media-libs/gst-plugins-good 
	media-plugins/gst-plugins-meta"
DEPEND=""

S="${WORKDIR}"

src_prepare() {
	sed -i "s|python|python2|g" ${S}/${PN}-${PV}/${PN} || die "Cannot sed file"
}

src_install() {
	cd "${S}"
	dodir /usr/share/${PN} || die
	insinto /usr/share/${PN} || die
	doins -r "${S}"/${PN}-${PV}/* || die
	fperms 755 /usr/share/${PN}/${PN} || die "Errors on permission giving"
	fperms 755 /usr/share/${PN} || die "Errors on permission folder giving"
	dosym /usr/share/${PN}/${PN} /usr/bin/${PN} || die "Not too many symbolic links"
	make_desktop_entry tv-maxe TV-maxe \
		"/usr/share/tv-maxe/tvmaxe_mini.png" \
		Video
}
