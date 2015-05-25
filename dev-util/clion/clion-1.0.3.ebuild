# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils versionator

RDEPEND=">=virtual/jdk-1.6"

RESTRICT="strip"
QA_TEXTRELS="opt/${P}/bin/libbreakgen.so"

DESCRIPTION="The intelligent cross-platform C/C++ IDE"
HOMEPAGE="http://jetbrains.com/clion/"
SRC_URI="http://download.jetbrains.com/cpp/${P}.tar.gz"
LICENSE="all-rights-reserved"
SLOT="0"
IUSE=""
KEYWORDS="~amd64 ~x86"

src_install() {
	local dir="/opt/${P}"
	local exe="${PN}"

	insinto "${dir}"
	doins -r *
	fperms 755 "${dir}/bin/${PN}.sh" "${dir}/bin/fsnotifier" "${dir}/bin/fsnotifier64"

	newicon "bin/${PN}.svg" "${exe}.svg"
	make_wrapper "${exe}" "/opt/${P}/bin/${PN}.sh"
	make_desktop_entry ${exe} "CLion $(get_version_component_range 1-3)" "${exe}" "Development;IDE"
}
