# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

USE_RUBY="ruby19 ruby20 ruby21"
RUBY_FAKEGEM_EXTRADOC="README"
RUBY_FAKEGEM_VERSION="0.4.4.1.20130805"
inherit ruby-fakegem

DESCRIPTION="GRAph Theory in Ruby"
HOMEPAGE="https://github.com/4r2r/gratr"
COMMIT_ID="ba870fdb5bd6b5e3a7a965c57dad1d67d2ec4eaa"
SRC_URI="https://github.com/4r2r/gratr/archive/${COMMIT_ID}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RUBY_S="gratr-${COMMIT_ID}"

ruby_add_rdepend "dev-ruby/priorityqueue"

all_ruby_prepare() {
	# Remove bundled lib
	rm -r lib/priority-queue || die
}
