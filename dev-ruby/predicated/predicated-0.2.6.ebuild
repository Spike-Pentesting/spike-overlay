# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19 ruby20"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.markdown"

inherit ruby-fakegem

DESCRIPTION="A simple predicate model for Ruby"
HOMEPAGE="https://github.com/sconover/predicated"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

#Dependencies missing

RESTRICT=test

each_ruby_test() {
	${RUBY} -Ilib:test test/suite.rb || die
}
