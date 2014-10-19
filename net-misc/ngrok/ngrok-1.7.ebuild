# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Introspected tunnels to localhost"
SRC_URI="https://github.com/inconshreveable/ngrok/archive/${PV}.tar.gz"
HOMEPAGE="https://ngrok.com/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-lang/go-1.2
	dev-vcs/mercurial
	dev-vcs/git"

src_compile(){
	emake release-all
}

src_install(){
	dobin "${S}"/bin/ngrok
	dobin "${S}"/bin/ngrokd
}
