# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

USE_RUBY="ruby19"
RUBY_FAKEGEM_EXTRADOC="README.rdoc History.rdoc Versionomy.rdoc "

inherit multilib ruby-fakegem

DESCRIPTION="Generalized version number library"
HOMEPAGE="http://dazuma.github.com/versionomy"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "dev-ruby/blockenspiel"

all_ruby_prepare() {
	epatch "${FILESDIR}"/${P}-fix-tests.patch
}

each_ruby_test() {
	for i in custom_format readme_examples rubygems_basic rubygems_conversions semver_basic semver_conversions standard_basic standard_change standard_comparison standard_misc standard_parse standard_reset version_of;
	do
		${RUBY} -I lib test/tc_${i}.rb || die "Test failed"
	done
}
