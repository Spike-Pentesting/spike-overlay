# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

SRC_URI="https://github.com/Spike-Pentesting/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
HOMEPAGE="https://github.com/Spike-Pentesting/enman"
inherit perl-module

DESCRIPTION="a layman equivalent for entropy repositories"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
    dev-perl/App-Cmd
    dev-perl/LWP-Protocol-https
    virtual/perl-Encode
    dev-perl/libwww-perl
    virtual/perl-Term-ANSIColor
"
RDEPEND="${DEPEND}"

SRC_TEST="do"
