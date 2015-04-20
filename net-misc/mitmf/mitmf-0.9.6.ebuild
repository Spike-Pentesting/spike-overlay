# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit eutils python-single-r1 git-2

DESCRIPTION="Framework for Man-In-The-Middle attacks"
HOMEPAGE="https://github.com/byt3bl33d3r/MITMf"
#SRC_URI="https://github.com/byt3bl33d3r/MITMf/archive/v${PV}.tar.gz -> ${P}.tar.gz"
EGIT_HAS_SUBMODULES=1
EGIT_COMMIT="v0.9.6"
EGIT_REPO_URI="git://github.com/byt3bl33d3r/MITMf.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="
	dev-python/capstone-python
	dev-python/twisted-core
	dev-python/twisted-web
	dev-python/requests
	net-analyzer/scapy
	net-misc/bdfactory
	dev-python/msgpack
	dev-python/dnspython
	dev-python/dnslib
	dev-python/pefile
	dev-python/configobj
	dev-python/pyyaml
	dev-python/pypcap
	dev-python/pillow
	dev-python/ipy
	dev-python/pyopenssl
	dev-python/service_identity
	dev-python/ua-parser
	dev-python/user-agents
"


RDEPEND="${DEPEND}"

S="${WORKDIR}/MITMf-${PV}"

src_install() {
	rm README.md LICENSE

	insinto /usr/share/${PN}
	doins -r "${S}"/*

	python_fix_shebang "${ED}"/usr/share/${PN}

	fperms +x /usr/share/${PN}/${PN}.py
#	dosym /usr/share/${PN}/${PN}.py /usr/bin/${PN}
	newsbin "${FILESDIR}"/${PN} ${PN}
}
