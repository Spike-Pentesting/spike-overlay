# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

DESCRIPTION="A source-based package manager for OCaml"
HOMEPAGE="http://opam.ocaml.org/"
LICENSE="LGPL-3-with-linking-exception"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="darcs git mercurial rsync"

if [[ ${PV} != 9999 ]]; then
	SRC_URI="https://github.com/ocaml/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
else
	inherit git-r3
	EGIT_REPO_URI="https://github.com/ocaml/opam.git"
fi

DEPEND="dev-lang/ocaml:=
	|| ( net-misc/wget net-misc/curl )
"
RDEPEND="${DEPEND}
	darcs? ( dev-vcs/darcs )
	git? ( dev-vcs/git )
	mercurial? ( dev-vcs/mercurial )
	rsync? ( net-misc/rsync )
"

pkg_postinst() {
	elog 'You will need to run `opam init` before you start using opam. For'
	elog 'details, please see the opam(1) manual page.'
}
