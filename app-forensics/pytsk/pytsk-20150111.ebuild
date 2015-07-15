# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit versionator autotools-utils distutils-r1

MY_DATE="$(get_version_component_range 1)"

DESCRIPTION="Python bindings for the Sleuthkit"
HOMEPAGE="https://github.com/py4n6/pytsk/"
SRC_URI="https://github.com/py4n6/${PN}/releases/download/${MY_DATE}/${PN}-${MY_DATE}.tgz"

LICENSE="Apache-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="app-forensics/sleuthkit
	sys-libs/talloc
	${PYTHON_DEPS}"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"
