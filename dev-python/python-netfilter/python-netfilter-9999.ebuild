# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils git-2 versionator
inherit python

DESCRIPTION="python-netfilter is a set of modules for the  Python programming language which allows you to manipulate  netfilter rules."
HOMEPAGE="http://opensource.bolloretelecom.eu/projects/python-netfilter/"
EGIT_REPO_URI="https://github.com/jlaine/python-netfilter.git"

LICENSE="GPL3"
SLOT="0"
KEYWORDS=""
IUSE=""
DEPEND="dev-lang/python"
RDEPEND="${DEPEND}"
S="${WORKDIR}/${PN}"
src_install() {
	python setup.py install
}
