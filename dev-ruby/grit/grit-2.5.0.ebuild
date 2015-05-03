# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

USE_RUBY="ruby19"
RUBY_FAKEGEM_EXTRADOC="README.md"

inherit eutils ruby-fakegem

DESCRIPTION="Git Library for Ruby"
HOMEPAGE="http://rubyforge.org/projects/grit http://github.com/mojombo/grit"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND+=" dev-vcs/git"

ruby_add_rdepend "dev-ruby/diff-lcs
	dev-ruby/mime-types
	dev-ruby/posix-spawn"
