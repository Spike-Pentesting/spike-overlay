# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_RECIPE_TEST="rake"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md CONTRIBUTING.md README.md"

inherit ruby-fakegem

DESCRIPTION="HTML processing filters and utilities"
HOMEPAGE="https://github.com/jch/html-pipeline"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "dev-ruby/activesupport
	dev-ruby/nokogiri"

ruby_add_bdepend "test? ( dev-ruby/minitest:5
	dev-ruby/github-markdown
	dev-ruby/rinku
	dev-ruby/redcloth
	dev-ruby/sanitize )"

all_ruby_prepare() {
	sed -i -e "/bundler/d" Rakefile test/test_helper.rb || die
	# Not packaged gemoji, github-linguist
	rm test/html/pipeline/emoji_filter_test.rb test/html/pipeline/syntax_highlight_filter_test.rb || die
}
