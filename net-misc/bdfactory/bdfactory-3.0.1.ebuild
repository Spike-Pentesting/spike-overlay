# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 python3_3 python3_4)

inherit eutils python-single-r1

DESCRIPTION="Patch PE, ELF, Mach-O binaries with shellcode"
HOMEPAGE="https://github.com/secretsquirrel/the-backdoor-factory"
SRC_URI="https://github.com/secretsquirrel/the-backdoor-factory/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="
	dev-util/capstone
	dev-python/capstone-python
	dev-python/pefile
"


RDEPEND="${DEPEND}"

S="${WORKDIR}/the-backdoor-factory-${PV}"

src_install() {
	rm README.md COPYING
	
	insinto /usr/share/${PN}
	doins -r "${S}"/*

	python_fix_shebang "${ED}"/usr/share/${PN}

	fperms +x /usr/share/${PN}/backdoor.py
	dosym /usr/share/${PN}/backdoor.py /usr/bin/${PN}
}
