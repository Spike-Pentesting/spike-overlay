# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_TEST=""
RUBY_FAKEGEM_RECIPE_DOC=""

inherit ruby-fakegem

DESCRIPTION="Self-contained Markdown parser for GitHub, with all our custom extensions"
HOMEPAGE="https://rubygems.org/gems/github-markdown"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "test? ( dev-ruby/nokogiri
dev-ruby/test-unit )"

each_ruby_configure() {
	${RUBY} -Cext/markdown extconf.rb || die
}

each_ruby_compile() {
	emake V=1 -Cext/markdown
	cp ext/markdown/markdown$(get_modname) lib/github || die
}

each_ruby_test() {
	${RUBY} -Ilib test/gfm_test.rb || die
}
