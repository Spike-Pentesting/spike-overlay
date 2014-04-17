# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils multilib

MY_P=${PN/t/T}
MY_P=${MY_P/c/C}


inherit git-2
EGIT_REPO_URI="git://github.com/prof7bit/${MY_P}.git"


DESCRIPTION="Decentralized anonymous instant messenger on top of Tor Hidden Services"
HOMEPAGE="https://github.com/prof7bit/TorChat#readme"
EGIT_BRANCH="${PN}2"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-lang/fpc
	dev-lang/lazarus
	net-misc/tor
	"

DEPEND="${RDEPEND}"
src_install() {
	  
		make all
		make install
		}
