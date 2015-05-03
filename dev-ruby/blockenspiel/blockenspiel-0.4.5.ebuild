# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

USE_RUBY="ruby19"

RUBY_FAKEGEM_TASK_DOC="doc:rdoc"

RUBY_FAKEGEM_EXTRADOC="Blockenspiel.rdoc History.rdoc ImplementingDSLblocks.rdoc README.rdoc"
RUBY_FAKEGEM_EXTRAINSTALL="Version"

inherit multilib ruby-fakegem

DESCRIPTION="helper library to implement DSL blocks easily"
HOMEPAGE="https://github.com/dazuma/blockenspiel"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

each_ruby_configure() {
	${RUBY} -Cext/unmixer_mri extconf.rb || die
}

each_ruby_compile() {
	emake -Cext/unmixer_mri
	cp ext/unmixer_mri/unmixer_mri$(get_modname) lib/${PN} || die
}

each_ruby_test() {
	for i in basic behaviors dsl_attrs dsl_methods dynamic embedded_block mixins modules version; do
		${RUBY} -Ilib test/tc_${i}.rb || die "Test failed"
	done
}
