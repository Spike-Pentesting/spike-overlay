# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils

MY_BUILD="15707"

DESCRIPTION="Freeware advanced editor for dynamic and Web languages"
HOMEPAGE="http://www.activestate.com/products/komodo_edit"
LICENSE="MPL-1.1"

SRC_URI="x86?   ( http://downloads.activestate.com/Komodo/releases/${PV}/Komodo-Edit-${PV}-${MY_BUILD}-linux-x86.tar.gz    )
	 amd64? ( http://downloads.activestate.com/Komodo/releases/${PV}/Komodo-Edit-${PV}-${MY_BUILD}-linux-x86_64.tar.gz )"

SLOT="0"
KEYWORDS="~x86 ~amd64"

IUSE="templates"

DEPEND="virtual/jpeg
	virtual/libc"

RDEPEND="${DEPEND}"

RESTRICT="mirror"

use amd64 && MY_ARCH='x86_64' || MY_ARCH=${ARCH}
S="${WORKDIR}/Komodo-Edit-${PV}-${MY_BUILD}-linux-${MY_ARCH}"

src_install() {

	KOMODO_EDIT_INSTALLDIR="/opt/${P}"

	dodir "${KOMODO_EDIT_INSTALLDIR}"

	"${S}/install.sh" \
		--install-dir "${D}${KOMODO_EDIT_INSTALLDIR}" \
		--dest-dir ${KOMODO_EDIT_INSTALLDIR} \
		--suppress-shortcut || die "original installer script failed"

	dosym "${KOMODO_EDIT_INSTALLDIR}/bin/komodo" "/usr/bin/${P}" &&
	dosym "./${P}" "/usr/bin/${PN}" ||
		die "failed dosym Komodo launcher script"

	rm -R "${KOMODO_EDIT_INSTALLDIR}/bin/komodo"
	dosym "${KOMODO_EDIT_INSTALLDIR}/lib/mozilla/komodo" "${KOMODO_EDIT_INSTALLDIR}/bin/komodo"

	# Most default templates are empty, or near-empty, and can clutter
	# the new file dialog, so we permit not to install them.
	use templates || (
		rm -R "${D}/${KOMODO_EDIT_INSTALLDIR}/"lib/mozilla/extensions/*/templates/* &&
		rm -R "${D}/${KOMODO_EDIT_INSTALLDIR}/"lib/support/default-templates/* ||
			die "failed removing default templates"
	)

	dodoc install.html license.txt relnotes.html || die "dodoc failed"

	dosym "${KOMODO_EDIT_INSTALLDIR}/share/icons/komodo48.png" \
		"/usr/share/pixmaps/${PN}.png" || die "dosym pixmap icon failed"

	make_desktop_entry \
		"${PN}" \
		"Komodo Edit" \
		"${PN}.png" \
		"Development;IDE;Editor;TextEditor;ActiveState" ||
			die "make_desktop_entry failed"
}
