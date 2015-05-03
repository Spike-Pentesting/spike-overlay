# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# radicale also supports python3_{2,3}
# but python-ldap, dulwich and flup are blocking here
PYTHON_COMPAT=( python2_7 )
PYTHON_REQ_USE="ssl?"

inherit distutils-r1 user

MY_PN="Radicale"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="A simple CalDAV calendar server"
HOMEPAGE="http://www.radicale.org/"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="fastcgi git ldap mysql sqlite postgres ssl"

RDEPEND="
	fastcgi? ( dev-python/flup[${PYTHON_USEDEP}] )
	git? ( dev-python/dulwich[${PYTHON_USEDEP}] )
	ldap? ( dev-python/python-ldap[${PYTHON_USEDEP}] )
	mysql? ( dev-python/sqlalchemy[${PYTHON_USEDEP}]
		dev-python/mysql-python[${PYTHON_USEDEP}] )
	sqlite? ( dev-python/sqlalchemy[${PYTHON_USEDEP},sqlite] )
	postgres? ( dev-python/sqlalchemy[${PYTHON_USEDEP}]
		dev-python/psycopg:2[${PYTHON_USEDEP}] )"

# radicale's authentication against PAM is not possible here:
# Gentoo has not included the package
# also it seems old, which is bad with respect to
# http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-1502

S=${WORKDIR}/${MY_P}

RDIR=/var/lib/radicale
LDIR=/var/log/radicale

PATCHES=( "${FILESDIR}"/${P}-config.patch )

pkg_setup() {
	enewgroup radicale
	enewuser radicale -1 -1 ${RDIR} radicale
}

python_install_all() {
	# delete the useless .rst, so that it is not installed
	rm README.rst

	# init file
	newinitd "${FILESDIR}"/radicale.init.d radicale

	# directories
	diropts -m0750
	dodir ${RDIR}
	fowners radicale:radicale ${RDIR}
	dodir ${LDIR}
	fowners radicale:radicale ${LDIR}

	# config file
	insinto /etc/${PN}
	doins config logging

	# fcgi and wsgi files
	insinto /usr/share/${PN}
	doins radicale.wsgi
	use fastcgi && doins radicale.fcgi

	distutils-r1_python_install_all
}

pkg_postinst() {
	einfo "Radicale now supports WSGI."
	einfo "A sample wsgi-script has been put into ${ROOT}usr/share/${PN}."
	use fastcgi && einfo "You will also find there an example fcgi-script."
}
