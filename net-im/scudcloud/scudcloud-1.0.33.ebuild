# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{3_3,3_4} )
inherit python-r1 versionator
MY_AUTHOR="raelgc"
DESCRIPTION="A Linux client for Slack"
HOMEPAGE="https://github.com/${MY_AUTHOR}/${PN}"

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/${MY_AUTHOR}/${PN}.git"
	KEYWORDS=""
else
        SRC_URI="https://github.com/${MY_AUTHOR}/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE="-doc"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"
DEPEND="${PYTHON_DEPS}
	dev-python/dbus-python[${PYTHON_USEDEP}]
	dev-python/PyQt4[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"

MY_PV=$(get_version_component_range 1-2)
MY_S="${WORKDIR}/${P}/${PN}-${MY_PV}"
MY_INSTALLDIR="/opt/scudcloud"
src_prepare() {
	epatch "${FILESDIR}/${P}.patch"
}

src_install() {
	if use doc; then
		dodoc README.md CONTRIBUTING.md
	fi
	exeinto "${MY_INSTALLDIR}"
	doexe "${MY_S}/scudcloud"
	insinto "${MY_INSTALLDIR}"
	doins "${MY_S}/LICENSE"
	insinto "${MY_INSTALLDIR}/lib"
	doins "${MY_S}/lib/"*
	insinto "${MY_INSTALLDIR}/resources"
	doins "${MY_S}/resources/"*
	insinto "/usr/share/applications"
	doins "${MY_S}/scudcloud.desktop"
	doicon -s scalable "${MY_S}/systray/hicolor/"*
	doicon -s scalable -t mono-dark "${MY_S}/systray/mono-dark/"*
	doicon -s scalable -t mono-light "${MY_S}/systray/mono-light/"*
	dosym  "${MY_INSTALLDIR}/scudcloud" "/usr/bin/scudcloud"
}
