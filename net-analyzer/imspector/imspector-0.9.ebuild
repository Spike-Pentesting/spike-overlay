# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=2

inherit toolchain-funcs

DESCRIPTION="Instant Messenger transparent proxy with logging capabilities."
HOMEPAGE="http://www.imspector.org/"
SRC_URI="http://www.imspector.org/downloads/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
RESTRICT="nomirror"
IUSE="ssl mysql sqlite postgres dbresponder dbfilter"

DEPEND="ssl? ( dev-libs/openssl )
	mysql? ( dev-db/mysql )
	sqlite? ( dev-db/sqlite:3 )
	postgres? ( virtual/postgresql-base )
	dbresponder? ( dev-db/sqlite:3 )
	dbfilter? ( dev-db/sqlite:3 )
	"

RDEPEND="${DEPEND}"

S="${WORKDIR}/${P}"

src_unpack() {
	
	local ADDON_PLUGINS
	
	unpack ${A}
	cd ${S}

	patch -i "${FILESDIR}"/imspector.patch

	if ! use ssl; then
	    sed -i -e "s:SSL = yes:#SSL = yes:" Makefile || die
	fi

	if use mysql; then
	    ADDON_PLUGINS="${ADDON_PLUGINS} mysqlloggingplugin.so"
	fi
	
	if use sqlite; then
	    ADDON_PLUGINS="${ADDON_PLUGINS} sqliteloggingplugin.so"
	fi
	
	if use postgres; then
	    ADDON_PLUGINS="${ADDON_PLUGINS} postgresqlloggingplugin.so"
	fi
	
	if use dbresponder; then
	    ADDON_PLUGINS="${ADDON_PLUGINS} dbresponderplugin.so"
	fi

	if use dbfilter; then
	    ADDON_PLUGINS="${ADDON_PLUGINS} dbfilterplugin.so"
	fi

	echo ${ADDON_PLUGINS}
	
	if use mysql || use postgres || use sqlite || use dbfilter || use dbresponder ; then
	    sed -i "s:#ADD_PLUGINS = .*:ADD_PLUGINS = ${ADDON_PLUGINS}:" Makefile
	    echo ""
	fi

	sed -i -e 's:/usr/etc:/etc:' imspector.conf || die
#	sed -i -e 's/^CXXFLAGS =.*/CXXFLAGS += -fPIC/' "${S}"/Makefile
	sed -i -e '/#define DEFAULT_CONFIG/s:/usr::' main.cpp || die
}

src_compile() {
	emake CXX="$(tc-getCXX)" || die 'emake failed'
}

src_install() {
	dosbin imspector || die 'install failed'
	dolib.so libimspector.so
	insinto /usr/lib/imspector
	insopts -m0755
	doins *plugin.so
	insinto /etc/imspector
	insopts -m0644
	newins imspector.conf imspector.conf.example
	newins badwords.txt badwords.txt.example
	newins acl.txt acl.txt.example
	newinitd ${FILESDIR}/imspector.init imspector
	newconfd ${FILESDIR}/imspector.conf imspector
	dodir /var/log/imspector
	dodir /share/imspector/contrib
	insinto /share/imspector/contrib
	doins contrib/imspector.cgi
}

pkg_postinst(){
	echo ""
	einfo "imspector not include documentation."
	einfo "More info about configure imspector on http://www.imspector.org"
	echo ""
	if use ssl; then
		einfo "To create and install certificates (for example):"
		echo ""
		einfo "create serverkey.pem:"
		einfo "openssl req -new -newkey rsa:1024 -days 365 -nodes -x509 -keyout /etc/imspector/serverkey.pem -out /etc/imspector/servercert.pem"
		echo ""
		einfo "and create cakey.pem:"
		einfo "openssl req -new -newkey rsa:1024 -days 365 -nodes -x509 -keyout /etc/imspector/cakey.pem -out /etc/imspector/cacert.pem"
	fi
	echo ""
	einfo "Also included CGI-script: /share/imspector/contrib/imspector.cgi"
	einfo "This is a log viewer of IMSpector logs, written in perl."
	einfo "It has no dependancies other then a working perl installation and should be installed"
	einfo "under a webserver cgi-bin directory."
}
