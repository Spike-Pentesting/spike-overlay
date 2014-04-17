# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils python

DESCRIPTION="A multi-purpose brute-forcer, with a modular design and a flexible usage"
HOMEPAGE="https://code.google.com/p/patator/"

KEYWORDS="~amd64 ~x86"
LICENSE="GPL-2"
SLOT="${PV}"

MY_D="/usr/share/${PN}"
if [[ ${PV} == "9999" ]] ; then
	inherit git-2
	EGIT_REPO_URI="https://code.google.com/p/patator/"
else
	SRC_URI="http://patator.googlecode.com/files/"${PN}"_v"${PVR}".py"
	S="${DISTDIR}"
fi

src_install() {
	dodir "${MY_D}"
	insinto "${MY_D}"
	insopts -m0755
	if [[ ${PV} != "9999" ]] ; then
		doins "${PN}"_v"${PVR}".py
		mv "${D}${MY_D}"/"${PN}"_v"${PVR}".py "${D}${MY_D}"/"${PN}".py
	else
		doins "${PN}".py || die "Install Failed"
	fi
	dosym "${MY_D}"/"${PN}".py /usr/bin/"${PN}"
}
