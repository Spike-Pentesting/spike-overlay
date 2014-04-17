# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
#SUPPORT_PYTHON_ABIS="1"
inherit eutils
inherit python
DESCRIPTION="SSH Bruteforcer"
HOMEPAGE="http://www.edge-security.com/"
SRC_URI="http://www.edge-security.com/soft/${P}.tar"
LICENSE="GPL3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="gnome X"
DEPEND=">=dev-python/paramiko-1.7.7.1"
RDEPEND="${DEPEND}"
S="${WORKDIR}/${PN}"

#src_configure() {
	# Most open-source packages use GNU autoconf for configuration.
	# The default, quickest (and preferred) way of running configure is:
	#econf
	#
	# You could use something similar to the following lines to
	# configure your package before compilation.  The "|| die" portion
	# at the end will stop the build process if the command fails.
	# You should use this at the end of critical commands in the build
	# process.  (Hint: Most commands are critical, that is, the build
	# process should abort if they aren't successful.)
	#./configure \
	#	--host=${CHOST} \
	#	--prefix=/usr \
	#	--infodir=/usr/share/info \
	#	--mandir=/usr/share/man || die
	# Note the use of --infodir and --mandir, above. This is to make
	# this package FHS 2.2-compliant.  For more information, see
	#   http://www.pathname.com/fhs/
#}

# The following src_compile function is implemented as default by portage, so
# you only need to call it, if you need different behaviour.
# For EAPI < 2 src_compile runs also commands currently present in
# src_configure. Thus, if you're using an older EAPI, you need to copy them
# to your src_compile and drop the src_configure function.
#src_compile() {
	# emake (previously known as pmake) is a script that calls the
	# standard GNU make with parallel building options for speedier
	# builds (especially on SMP systems).  Try emake first.  It might
	# not work for some packages, because some makefiles have bugs
	# related to parallelism, in these cases, use emake -j1 to limit
	# make to a single process.  The -j1 is a visual clue to others
	# that the makefiles have bugs that have been worked around.

	#emake || die
#}

# The following src_install function is implemented as default by portage, so
# you only need to call it, if you need different behaviour.
# For EAPI < 4 src_install is just returing true, so you need to always specify
# this function in older EAPIs.
src_install() {
	
	mkdir -p "${D}"/usr/bin
	cp "${PN}".py "${D}"/usr/bin
	mkdir -p "${D}/$(python_get_libdir)"
	cp terminal.py "${D}/$(python_get_libdir)"
	
}
