# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

USE_RUBY="ruby19 ruby20 ruby21"
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="Ruby bindings to the libgit2 linkable C Git library"
HOMEPAGE="https://github.com/libgit2/rugged"
SRC_URI="https://github.com/libgit2/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/libgit2/libgit2/archive/v${PV}.tar.gz -> ${P}-libgit2.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND+=" >=dev-libs/libgit2-${PV}"

ruby_add_bdepend "test? (
	dev-ruby/minitest
	dev-ruby/pry
	dev-ruby/rake-compiler )"

all_ruby_unpack() {
	[[ -n ${A} ]] && unpack ${A}
	mv libgit2-*/* ${P}/vendor/libgit2/ || die
}

all_ruby_prepare() {
	# This test fails if no global user name is set. Avoid it.
	sed -i -e "/user.name/s/^/#/" test/config_test.rb || die
}

each_ruby_configure() {
	${RUBY} -Cext/${PN} extconf.rb --use-system-libraries || die
}

each_ruby_compile() {
	emake V=1 -Cext/${PN}
	cp ext/${PN}/${PN}$(get_modname) lib/${PN} || die
}
