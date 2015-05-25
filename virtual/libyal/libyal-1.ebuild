# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="A virtual for the common core libraries used by Joachim Metz' toolset"
HOMEPAGE="https://github.com/libyal/libyal"
SRC_URI=""

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-libs/libcdata
	dev-libs/libcdatetime
	dev-libs/libcerror
	dev-libs/libclocale
	dev-libs/libcnotify
	dev-libs/libcfile
	dev-libs/libcpath
	dev-libs/libcsplit
	dev-libs/libcthreads
	dev-libs/libfcache
	dev-libs/libfdata
	dev-libs/libfdatetime
	dev-libs/libfguid
	dev-libs/libfwnt
	dev-libs/libfwsi
	dev-libs/libcaes
	dev-libs/libhmac
	dev-libs/libuna
	app-forensics/libbfio"
RDEPEND="${DEPEND}"
