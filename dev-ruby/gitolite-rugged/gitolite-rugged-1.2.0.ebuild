# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

USE_RUBY="ruby19 ruby20 ruby21"
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_TEST_RECIPE="rspec3"

inherit ruby-fakegem

DESCRIPTION="A Ruby interface for the Gitolite Git backend system"
HOMEPAGE="https://github.com/jbox-web/gitolite-rugged"
SRC_URI="https://github.com/jbox-web/gitolite-rugged/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rugged-0.22
	dev-ruby/gratr19"
ruby_add_bdepend "test? ( dev-ruby/forgery
	dev-ruby/spork )"

all_ruby_prepare() {
	sed -i -e '/[Bb]undler/d' -e '/ci\/reporter/d' Rakefile || die
	sed -i -e '/[Ss]imple[Cc]ov/d' spec/spec_helper.rb || die
}
