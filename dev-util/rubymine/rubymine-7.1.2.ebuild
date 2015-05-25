# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils versionator

SLOT="$(get_major_version)"
RDEPEND=">=virtual/jdk-1.7"

MY_PN="RubyMine"
RESTRICT="strip"
QA_TEXTRELS="opt/${P}/bin/libbreakgen.so"

DESCRIPTION="The most intelligent Ruby and Rails IDE"
HOMEPAGE="http://jetbrains.com/ruby/"
SRC_URI="http://download.jetbrains.com/ruby/${MY_PN}-${PV}.tar.gz"
LICENSE="all-rights-reserved"
IUSE=""
KEYWORDS="~amd64 ~x86"
S="${WORKDIR}/${MY_PN}-${PV}"

src_install() {
	local dir="/opt/${P}"
	local exe="${PN}-${SLOT}"

	insinto "${dir}"
	doins -r *
	fperms 755 "${dir}/bin/${PN}.sh" "${dir}/bin/rinspect.sh" "${dir}/bin/fsnotifier" "${dir}/bin/fsnotifier64"

	newicon "bin/${PN}.png" "${exe}.png"
	make_wrapper "${exe}" "/opt/${P}/bin/${PN}.sh"
	make_desktop_entry ${exe} "RubyMine ${PV}" "${exe}" "Development;IDE"
}
