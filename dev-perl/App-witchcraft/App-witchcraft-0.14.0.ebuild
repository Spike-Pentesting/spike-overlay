# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

SRC_URI="https://github.com/Spike-Pentesting/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
HOMEPAGE="https://github.com/Spike-Pentesting/App-Witchcraft"
inherit perl-module

DESCRIPTION="Continuous integration tool for Entropy server"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-perl/App-Nopaste
	dev-perl/App-CLI
	dev-perl/Child
	dev-perl/Carp-Always
	dev-perl/Config-Simple
	virtual/perl-Digest-MD5
	virtual/perl-Encode
	virtual/perl-File-Path
	dev-perl/IPC-Run3
	dev-perl/Git-Sub
	dev-perl/HTTP-Message
	dev-perl/libwww-perl
	dev-perl/regexp-common
	virtual/perl-Term-ANSIColor
	dev-perl/TermReadKey
	dev-perl/Import-Into
"
RDEPEND="${DEPEND}"

SRC_TEST="do"
