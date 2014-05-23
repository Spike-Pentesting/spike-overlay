# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=4
inherit eutils
inherit python
DESCRIPTION="Weevely is a stealth PHP web shell that simulate telnet-like connection. It is an essential tool for web application post exploitation, and can be used as stealth backdoor or as a web shell to manage legit web accounts, even free hosted ones."
HOMEPAGE="http://epinna.github.com/Weevely/"
SRC_URI="https://github.com/epinna/Weevely/archive/v${PV}.tar.gz"
LICENSE="GPL3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
DEPEND="dev-lang/python"
RDEPEND="${DEPEND}"
S="${WORKDIR}/Weevely-${PV}"

src_install() {
	dodir /usr/share/weevely
	WEEVELY="/usr/share/weevely"
    	cp -R "${S}"/* "${D}/${WEEVELY}" || die "Install failed!"
	dodir /usr/bin
	insinto /usr/bin
	echo -e "#!/bin/sh\n" > weevely
	echo -e "${WEEVELY}/${PN}.py \$@\n" >> weevely
	doins weevely
	fperms +x /usr/bin/weevely
	fperms +x "${WEEVELY}"/weevely.py
}
