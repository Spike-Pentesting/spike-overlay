# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

USE_RUBY="ruby20 ruby21"
inherit ruby-ng user

DESCRIPTION="A plugin which lets you annotate source code within the repository browser"
HOMEPAGE="http://www.r-labs.org/projects/codereview https://bitbucket.org/haru_iida/redmine_code_review"
SRC_URI="https://bitbucket.org/haru_iida/redmine_code_review/downloads/${P}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND+=" app-arch/unzip"

ruby_add_rdepend ">=www-apps/redmine-3"

RUBY_S=${PN}

REDMINE_DIR="/var/lib/redmine"

pkg_setup() {
	enewgroup redmine
	enewuser redmine -1 -1 "${REDMINE_DIR}" redmine
}

all_ruby_install() {
	dodoc README.rdoc
	rm README.rdoc GPL.txt rvm-installer rvm.env || die
	dodir "${REDMINE_DIR}"/plugins/${PN}
	insinto "${REDMINE_DIR}"/plugins/${PN}
	doins -r .
	fowners -R redmine:redmine "${REDMINE_DIR}"/plugins/${PN}
}

pkg_postinst() {
	einfo
	elog "Please run emerge --config =${PF}"
	einfo
}

pkg_config() {
	local RAILS_ENV=${RAILS_ENV:-production}
	if [ ! -L /usr/bin/ruby ]; then
		eerror "/usr/bin/ruby is not a valid symlink to any ruby implementation."
		eerror "Please update it via `eselect ruby`"
		die
	fi
	if [[ $RUBY_TARGETS != *$( eselect ruby show | awk 'NR==2' | tr  -d ' '  )* ]]; then
		eerror "/usr/bin/ruby is currently not included in redmine's ruby targets: ${RUBY_TARGETS}."
		eerror "Please update it via `eselect ruby`"
		die
	fi

	local RUBY=${RUBY:-ruby}
	einfo "Upgrading the plugin migrations."
	cd "${EPREFIX}${REDMINE_DIR}" || die
	RAILS_ENV="${RAILS_ENV}" ${RUBY} -S rake redmine:plugins:migrate || die
}
