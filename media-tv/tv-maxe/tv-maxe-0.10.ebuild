# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils

DESCRIPTION="Program to view free channels"
HOMEPAGE="http://code.google.com/p/tv-maxe"
SRC_URI="https://launchpad.net/~venerix/+archive/ubuntu/pkg/+files/${PN}_${PV}-0ubuntu1~trusty.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+sqlite vlc mplayer +gstreamer"

DEPEND="dev-lang/python:2.7[sqlite]"
RDEPEND="dev-python/pillow
	mplayer? ( || (
		media-video/mplayer2
		media-video/mplayer
	) )
	vlc? ( media-video/vlc )
	virtual/ffmpeg
	dev-python/python-virtkey
	dev-python/pygtk
	dev-lang/python:2.7[sqlite]
	media-tv/sp-auth
	media-video/rtmpdump
	gstreamer? ( 
		>=dev-python/gst-python-0.10.22-r1:0.10
		>=media-libs/gst-plugins-good-0.10.31-r1:0.10
	)"

S="${WORKDIR}/${PN}-${PV}"

src_prepare() {
	sed -i "s|python|python2|g" ${S}/${PN}/${PN} || die "Cannot sed file"
}

src_install() {
	cd "${S}"
	dodir /usr/share/${PN} || die
	insinto /usr/share/${PN} || die
	doins -r "${S}"/${PN}/* || die
	fperms 755 /usr/share/${PN}/${PN} || die "Errors on permission giving"
	fperms 755 /usr/share/${PN} || die "Errors on permission folder giving"
	dosym /usr/share/${PN}/${PN} /usr/bin/${PN} || die "Not too many symbolic links"
	make_desktop_entry tv-maxe TV-maxe \
		"/usr/share/tv-maxe/tvmaxe_mini.png" \
		AudioVideo
}
