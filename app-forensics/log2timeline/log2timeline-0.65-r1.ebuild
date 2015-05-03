# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit perl-module

DESCRIPTION="Log2timeline super timeline tool"
HOMEPAGE="http://code.google.com/p/log2timeline/"
SRC_URI="http://${PN}.googlecode.com/files/${PN}_${PV}.tgz"

LICENSE="GPL3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}/${PN}_${PV}"

DEPEND="media-libs/exiftool
	>=dev-perl/Archive-Zip-1.18
	dev-perl/Carp-Assert
	dev-perl/DBI
	dev-perl/DBD-SQLite
	dev-perl/Data-Hexify
	dev-perl/DateTime
	dev-perl/DateTime-Format-Strptime
	dev-perl/DateTime-TimeZone
	dev-perl/Digest-CRC
	dev-perl/HTML-Scrubber
	dev-perl/Net-Pcap
	dev-perl/NetPacket
	dev-perl/Params-Validate
	dev-perl/XML-LibXML
	dev-perl/File-Mork
	dev-perl/JSON-XS
	dev-perl/Mac-PropertyList
	dev-perl/Parse-Win32Registry"
RDEPEND="${DEPEND}"
