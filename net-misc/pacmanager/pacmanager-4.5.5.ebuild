# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils multilib

DESCRIPTION="PAC is a Perl/GTK Gnome replacement for SecureCRT/Putty/etc and more"
HOMEPAGE="http://sites.google.com/site/davidtv/"
SRC_URI="mirror://sourceforge/${PN}/pac-4.0/pac-${PV}-all.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
    dev-lang/perl[ithreads]
    dev-perl/gtk2-gladexml
    dev-perl/Gtk2-Ex-Simple-List
    dev-perl/Gnome2-Vte
    dev-perl/Gnome2-GConf
    dev-perl/crypt-cbc
    dev-perl/Crypt-Blowfish
    dev-perl/Crypt-Rijndael
    dev-perl/Gtk2-SourceView2
    dev-perl/IO-Stty
    dev-perl/Net-ARP
    dev-perl/Expect
    dev-perl/Socket6
    dev-perl/yaml
    virtual/perl-Storable 
    dev-perl/Gtk2-Unique
    dev-libs/ossp-uuid[perl]"

src_prepare() {
    # external dependencies dev-perl/Gnome2-Vte
    rm -rf pac/lib/ex/vte*

    # change the references to the final 'lib' and 'res' locations
    einfo "Fixing lib and ref locations..."
    find pac/utils pac/lib pac/pac -type f | while read f
    do
	sed -i -e "s@\$RealBin[^']*\('\?\)\([./]*\)/lib@\1/usr/$(get_libdir)/pacmanager@g" "$f"
	sed -i -e "s@\$RealBin[^']*\('\?\)\([./]*\)/res@\1/usr/share/pacmanager@g" "$f"
    done
}

src_install() {
    dobin pac/pac
    dodoc pac/README

    doman pac/res/pac.1
    insinto /usr/share/applications
    doins pac/res/pac.desktop
    rm pac/res/{pac.1,pac.desktop}

    insinto /usr/share/pixmaps
    newins pac/res/pac64x64.png pac.png

    insinto /usr/$(get_libdir)/${PN}
    doins -r pac/lib/*
    insinto /usr/share/${PN}
    doins -r pac/res/*
    doins -r pac/utils
    doins pac/qrcode_pacmanager.png
}

pkg_postinst()
{
    einfo "${PN} supports ssh, sftp, ftp, xfreerdp, rdesktop, vncviewer,"
    einfo "cu/tip/remote-tty, mosh, cadaver connections. Please install those tools"
    einfo "if you need them."
    einfo
    einfo "Please install keepassx if you need a password manager."
}
