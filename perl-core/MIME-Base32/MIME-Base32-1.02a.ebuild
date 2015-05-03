# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit perl-module

DESCRIPTION="A base32/quoted-printable encoder/decoder Perl Modules"
HOMEPAGE="http://search.cpan.org/~danpeder/MIME-Base32/"
SRC_URI="mirror://cpan/authors/id/D/DA/DANPEDER/${P}.tar.gz"

LICENSE="|| ( Artistic GPL-2 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

SRC_TEST="do"

S=${WORKDIR}/${PN}-${PV/a/}
