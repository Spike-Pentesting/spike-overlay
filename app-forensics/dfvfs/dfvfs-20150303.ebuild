# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit versionator distutils-r1

MY_DATE="$(get_version_component_range 1)"

DESCRIPTION="Digital Forensics Virtual File System provides read-only access to file-system objects from various storage media types and file formats"
HOMEPAGE="https://github.com/log2timeline/dfvfs"
SRC_URI="https://github.com/log2timeline/${PN}/releases/download/${MY_DATE}/${PN}-${MY_DATE}.tar.gz"

LICENSE="Apache-2"
SLOT="0"
KEYWORDS="~amd64 ~hppa ~ppc ~x86"
IUSE=""
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="${PYTHON_DEPS}
	dev-python/six
	dev-python/pyconstruct
	dev-libs/protobuf[python]
	app-forensics/sleuthkit
	app-forensics/pytsk
	app-forensics/libbde[python]
	app-forensics/libewf[python]
	app-forensics/libqcow[python]
	app-forensics/libsigscan[python]
	app-forensics/libsmdev[python]
	app-forensics/libsmraw[python]
	app-forensics/libvhdi[python]
	app-forensics/libvmdk[python]
	app-forensics/libvshadow[python]"
RDEPEND="${DEPEND}"
