# Copyright 2011-2014 Andrey Ovcharov <sudormrfhalt@gmail.com>
# Distributed under the terms of the GNU General Public License v3
# $Header: $

# @ECLASS: grsec.eclass
# This file is part of sys-kernel/geek-sources project.
# @MAINTAINER:
# Andrey Ovcharov <sudormrfhalt@gmail.com>
# @AUTHOR:
# Original author: Andrey Ovcharov <sudormrfhalt@gmail.com> (12 Aug 2013)
# @LICENSE: http://www.gnu.org/licenses/gpl-3.0.html GNU GPL v3
# @BLURB: Eclass for building kernel with grsec patchset.
# @DESCRIPTION:
# This eclass provides functionality and default ebuild variables for building
# kernel with grsec patches easily.

# The latest version of this software can be obtained here:
# https://github.com/init6/init_6/blob/master/eclass/grsec.eclass
# Bugs: https://github.com/init6/init_6/issues
# Wiki: https://github.com/init6/init_6/wiki/geek-sources

case ${EAPI} in
	5)	: ;;
	*)	die "grsec.eclass: unsupported EAPI=${EAPI:-0}" ;;
esac

if [[ ${___ECLASS_ONCE_GRSEC} != "recur -_+^+_- spank" ]]; then
___ECLASS_ONCE_GRSEC="recur -_+^+_- spank"

inherit patch utils vars

EXPORT_FUNCTIONS src_prepare pkg_postinst

# @FUNCTION: init_variables
# @INTERNAL
# @DESCRIPTION:
# Internal function initializing all variables.
# We define it in function scope so user can define
# all the variables before and after inherit.
grsec_init_variables() {
	debug-print-function ${FUNCNAME} "$@"

	: ${GRSEC_VER:=${GRSEC_VER:-"${KSV}"}} # Patchset version
	: ${GRSEC_SRC:=${GRSEC_SRC:-"https://grsecurity.net/stable/grsecurity-${GRSEC_VER}.patch"}} # Patchset sources url
	: ${GRSEC_URL:=${GRSEC_URL:-"https://grsecurity.net"}} # Patchset url
	: ${GRSEC_INF:=${GRSEC_INF:-"${YELLOW}GrSecurity patch version ${GREEN}${GRSEC_VER}${YELLOW} from ${GREEN}${GRSEC_URL}${NORMAL}"}}

	debug-print "${FUNCNAME}: GRSEC_VER=${GRSEC_VER}"
	debug-print "${FUNCNAME}: GRSEC_SRC=${GRSEC_SRC}"
	debug-print "${FUNCNAME}: GRSEC_URL=${GRSEC_URL}"
	debug-print "${FUNCNAME}: GRSEC_INF=${GRSEC_INF}"
}

grsec_init_variables

HOMEPAGE="${HOMEPAGE} ${GRSEC_URL}"

SRC_URI="${SRC_URI}
	grsec?	( ${GRSEC_SRC} )"

DEPEND="${DEPEND}
	grsec?	( >=sys-apps/gradm-2.2.2 )"

RDEPEND=">=sys-devel/gcc-4.5"

# @FUNCTION: src_prepare
# @USAGE:
# @DESCRIPTION: Prepare source packages and do any necessary patching or fixes.
grsec_src_prepare() {
	debug-print-function ${FUNCNAME} "$@"

	ApplyPatch "${PORTAGE_ACTUAL_DISTDIR:-${DISTDIR}}/grsecurity-${GRSEC_VER}.patch" "${GRSEC_INF}"

	ApplyUserPatch "grsec"
}

# @FUNCTION: pkg_postinst
# @USAGE:
# @DESCRIPTION: Called after image is installed to ${ROOT}
grsec_pkg_postinst() {
	debug-print-function ${FUNCNAME} "$@"

	einfo "${GRSEC_INF}"
}

fi
