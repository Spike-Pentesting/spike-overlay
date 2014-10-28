# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/WWW-Mechanize-FormFiller/WWW-Mechanize-FormFiller-0.08.ebuild,v 1.4 2007/12/27 19:39:34 ticho Exp $

EAPI=5
inherit perl-module

DESCRIPTION="Interface to an iterator that checks a website"
SRC_URI="ftp://ftp.auckland.ac.nz/pub/perl/CPAN/authors/id/A/AB/ABELTJE/${P}.tar.gz" #cpan mirrors are dead for that dist
HOMEPAGE="http://search.cpan.org/dist/WWW-CheckSite/"

LICENSE="|| ( Artistic GPL-2 )"
SLOT="0"
KEYWORDS="amd64 sparc x86"
IUSE=""
S="${WORKDIR}"/"${P}"

SRC_TEST="do"

DEPEND="dev-lang/perl
	dev-perl/WWW-Mechanize
	dev-perl/HTML-Template"
