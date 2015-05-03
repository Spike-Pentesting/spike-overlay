# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} )

inherit versionator distutils-r1

DESCRIPTION="A tool designed to extract timestamps from various files found on a typical computer system(s) and aggregate them."
HOMEPAGE="https://code.google.com/p/plaso/"
SRC_URI="https://googledrive.com/host/0B30H7z4S52FleW5vUHBnblJfcjg/${PV}/release/${P}.tar.gz"

LICENSE="Apache-2"
SLOT="0"
KEYWORDS="~amd64 ~hppa ~ppc ~x86"
IUSE=""

DEPEND="app-forensics/dfvfs
		app-forensics/libbde[python]
		>=app-forensics/libesedb-20140301[python]
		app-forensics/libevt[python]
		app-forensics/libevtx[python]
		app-forensics/libewf[python]
		app-forensics/libexe[python]
		>=app-forensics/liblnk-20130304[python]
		>=app-forensics/libmsiecf-20130317[python]
		>=app-forensics/libolecf-20131012[python]
		app-forensics/libqcow[python]
		>=app-forensics/libregf-20130716[python]
		app-forensics/libsmraw[python]
		app-forensics/libvhdi[python]
		app-forensics/libvmdk[python]
		app-forensics/libvshadow[python]
		app-forensics/libwrc[python]
		app-forensics/pytsk
		app-misc/hachoir-metadata
		dev-libs/protobuf[python]
		dev-python/bencode
		dev-python/binplist
		dev-python/hachoir-core
		dev-python/hachoir-parser
		dev-python/psutil
		dev-python/pyconstruct"
RDEPEND="${DEPEND}"
