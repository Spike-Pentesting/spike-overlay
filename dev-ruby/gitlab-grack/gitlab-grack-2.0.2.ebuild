# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

USE_RUBY="ruby19 ruby20 ruby21"
RUBY_FAKEGEM_EXTRADOC="README.md CHANGELOG"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit eutils ruby-fakegem

DESCRIPTION="Git Smart HTTP Server Rack Implemenation. Gitlab fork"
HOMEPAGE="https://github.com/gitlabhq/grack"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

# Tests fail / hang
RESTRICT="test"

ruby_add_rdepend ">=dev-ruby/rack-1.5"
ruby_add_bdepend "test? ( dev-ruby/mocha:0.11 )"

all_ruby_prepare() {
	sed -i -e "/bundler/d" Rakefile || die
	sed -i -e 's#mocha#mocha/setup#' tests/main_test.rb || die
}

each_ruby_test() {
	${RUBY} -Ilib:tests tests/main_test.rb || die
}
