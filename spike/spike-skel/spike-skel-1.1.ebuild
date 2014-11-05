# Copyright 1999-2014 Gentoo
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
EGIT_COMMIT="${PVR}"
EGIT_REPO_URI="git://github.com/Spike-Pentesting/skel.git"

inherit eutils git-2 fdo-mime

DESCRIPTION="Spike Linux skel tree"
HOMEPAGE="http://www.spike-pentesting.org"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""
RDEPEND=""

src_install () {
	dodir /etc/xdg/menus
	cp "${S}"/* "${D}"/etc/ -Ra

	# Spike Menu
	dodir /usr/share/desktop-directories
	cp "${FILESDIR}"/1/directory/*.directory "${D}"/usr/share/desktop-directories/
	dodir /usr/share/spike
	cp -a "${FILESDIR}"/1/* "${D}"/usr/share/spike/
	doicon "${FILESDIR}"/1/pixmaps/spike.png
	chown root:root "${D}"/etc/skel -R
}

pkg_postinst () {
	if [ -x "/usr/bin/xdg-desktop-menu" ]; then

xdg-desktop-menu install --novendor\
                         /usr/share/spike/directory/spike-spike.directory \
                         /usr/share/spike/directory/rce.directory \
                         /usr/share/spike/desktop/malheur.desktop /usr/share/spike/desktop/jad.desktop /usr/share/spike/desktop/nasm.desktop /usr/share/spike/desktop/emilpro.desktop /usr/share/spike/desktop/edb.desktop /usr/share/spike/desktop/ltrace.desktop /usr/share/spike/desktop/insight.desktop /usr/share/spike/desktop/metasm disassemble metasm-gui.desktop /usr/share/spike/desktop/gradare.desktop /usr/share/spike/desktop/radare2.desktop /usr/share/spike/desktop/strace.desktop /usr/share/spike/desktop/gdb.desktop

xdg-desktop-menu install --novendor\
                         /usr/share/spike/directory/spike-spike.directory \
                         /usr/share/spike/directory/none.directory \
                         /usr/share/spike/desktop/irssi.desktop /usr/share/spike/desktop/xchat.desktop /usr/share/spike/desktop/urxvt.desktop /usr/share/spike/desktop/xterm.desktop

xdg-desktop-menu install --novendor\
                         /usr/share/spike/directory/spike-spike.directory \
                         /usr/share/spike/directory/mitm.directory \
                         /usr/share/spike/desktop/dnsspoof.desktop /usr/share/spike/desktop/filesnarf.desktop /usr/share/spike/desktop/macof.desktop /usr/share/spike/desktop/sshow.desktop /usr/share/spike/desktop/tcpkill.desktop /usr/share/spike/desktop/tcpnice.desktop /usr/share/spike/desktop/sshmitm.desktop /usr/share/spike/desktop/dsniff.desktop /usr/share/spike/desktop/webspy.desktop /usr/share/spike/desktop/urlsnarf.desktop /usr/share/spike/desktop/arpspoof.desktop /usr/share/spike/desktop/webmitm.desktop /usr/share/spike/desktop/mailsnarf.desktop /usr/share/spike/desktop/msgsnarf.desktop /usr/share/spike/desktop/ettercap.desktop /usr/share/spike/desktop/sslsniff.desktop /usr/share/spike/desktop/sslstrip.desktop /usr/share/spike/desktop/brctl.desktop /usr/share/spike/desktop/karmeta.sh.desktop

xdg-desktop-menu install --novendor\
                         /usr/share/spike/directory/spike-spike.directory \
                         /usr/share/spike/directory/forensics.directory \
                         /usr/share/spike/desktop/testdisk.desktop /usr/share/spike/desktop/xor-analyze.desktop /usr/share/spike/desktop/xor-dec.desktop /usr/share/spike/desktop/xor-enc.desktop /usr/share/spike/desktop/autopsy.desktop /usr/share/spike/desktop/cmospwd.desktop /usr/share/spike/desktop/dff.desktop /usr/share/spike/desktop/foremost.desktop /usr/share/spike/desktop/galleta.desktop /usr/share/spike/desktop/inception.desktop /usr/share/spike/desktop/memdump.desktop /usr/share/spike/desktop/pdfwalker.desktop pdf2graph pdf2pdfa pdf2ruby pdfcocoon pdfcop pdfdecompress pdfextract pdfsh /usr/share/spike/desktop/pasco.desktop /usr/share/spike/desktop/pdf-parser.desktop /usr/share/spike/desktop/pdfid.desktop /usr/share/spike/desktop/rdd.desktop /usr/share/spike/desktop/mactime.desktop /usr/share/spike/desktop/blkcalc.desktop /usr/share/spike/desktop/blkcat.desktop /usr/share/spike/desktop/blkls.desktop /usr/share/spike/desktop/blkstat.desktop /usr/share/spike/desktop/ffind.desktop /usr/share/spike/desktop/fls.desktop /usr/share/spike/desktop/fsstat.desktop /usr/share/spike/desktop/hfind.desktop /usr/share/spike/desktop/icat.desktop /usr/share/spike/desktop/ifind.desktop /usr/share/spike/desktop/ils.desktop /usr/share/spike/desktop/img_cat.desktop /usr/share/spike/desktop/img_stat.desktop /usr/share/spike/desktop/istat.desktop /usr/share/spike/desktop/jcat.desktop /usr/share/spike/desktop/jls.desktop /usr/share/spike/desktop/mmcat.desktop /usr/share/spike/desktop/mmls.desktop /usr/share/spike/desktop/mmstat.desktop /usr/share/spike/desktop/sigfind.desktop /usr/share/spike/desktop/sorter.desktop /usr/share/spike/desktop/srch_strings.desktop /usr/share/spike/desktop/tsk_comparedir.desktop /usr/share/spike/desktop/tsk_gettimes.desktop /usr/share/spike/desktop/tsk_loaddb.desktop /usr/share/spike/desktop/tsk_recover.desktop /usr/share/spike/desktop/volatility.desktop /usr/share/spike/desktop/vshadowinfo.desktop /usr/share/spike/desktop/vshadowmount.desktop /usr/share/spike/desktop/hivexget.desktop /usr/share/spike/desktop/hivexml.desktop /usr/share/spike/desktop/hivexregedit.desktop /usr/share/spike/desktop/hivexsh.desktop /usr/share/spike/desktop/dcfldd.desktop /usr/share/spike/desktop/dd_rescue.desktop /usr/share/spike/desktop/ddrescue.desktop

xdg-desktop-menu install --novendor\
                         /usr/share/spike/directory/spike-spike.directory \
                         /usr/share/spike/directory/scanner.directory \
                         /usr/share/spike/desktop/skipfish.desktop /usr/share/spike/desktop/autoscan.desktop /usr/share/spike/desktop/enum4linux.desktop /usr/share/spike/desktop/firewalk.desktop /usr/share/spike/desktop/hunt.desktop /usr/share/spike/desktop/ike-scan.desktop /usr/share/spike/desktop/nbtscan.desktop /usr/share/spike/desktop/nessus.desktop /usr/share/spike/desktop/nikto.desktop /usr/share/spike/desktop/nmap.desktop /usr/share/spike/desktop/nmap.desktop /usr/share/spike/desktop/nmbscan.desktop /usr/share/spike/desktop/onesixtyone.desktop /usr/share/spike/desktop/scanrand.desktop /usr/share/spike/desktop/ppscan.desktop /usr/share/spike/desktop/upnpscan.desktop /usr/share/spike/desktop/wapiti.desktop /usr/share/spike/desktop/webshag_cli webshag.desktop /usr/share/spike/desktop/wolpertinger.desktop /usr/share/spike/desktop/wpscan.desktop /usr/share/spike/desktop/zmap.desktop /usr/share/spike/desktop/arachni.desktop

xdg-desktop-menu install --novendor\
                         /usr/share/spike/directory/spike-spike.directory \
                         /usr/share/spike/directory/wireless.directory \
                         /usr/share/spike/desktop/asleap.desktop /usr/share/spike/desktop/makeivs-ng.desktop /usr/share/spike/desktop/ivstools.desktop /usr/share/spike/desktop/airdecap-ng.desktop /usr/share/spike/desktop/airolib-ng.desktop /usr/share/spike/desktop/aircrack-ng.desktop /usr/share/spike/desktop/airdecloak-ng.desktop /usr/share/spike/desktop/buddy-ng.desktop /usr/share/spike/desktop/packetforge-ng.desktop /usr/share/spike/desktop/tkiptun-ng.desktop /usr/share/spike/desktop/airmon-ng.desktop /usr/share/spike/desktop/airtun-ng.desktop /usr/share/spike/desktop/airbase-ng.desktop /usr/share/spike/desktop/airdriver-ng.desktop /usr/share/spike/desktop/aireplay-ng.desktop /usr/share/spike/desktop/wesside-ng.desktop /usr/share/spike/desktop/airserv-ng.desktop /usr/share/spike/desktop/airodump-ng.desktop /usr/share/spike/desktop/easside-ng.desktop /usr/share/spike/desktop/n4p.desktop /usr/share/spike/desktop/airoscript.desktop /usr/share/spike/desktop/airpwn.desktop /usr/share/spike/desktop/airsnort.desktop /usr/share/spike/desktop/airtraf.desktop /usr/share/spike/desktop/switch2ath5k.desktop switch2madwifi.desktop /usr/share/spike/desktop/cowpatty.desktop /usr/share/spike/desktop/gerix.desktop /usr/share/spike/desktop/gkismet.desktop gkismetauto.desktop /usr/share/spike/desktop/fern-wifi-cracker.desktop /usr/share/spike/desktop/hostapd.desktop /usr/share/spike/desktop/karmeta.sh.desktop /usr/share/spike/desktop/kismet.desktop /usr/share/spike/desktop/mdk3.desktop /usr/share/spike/desktop/orinoco-fwutils.desktop /usr/share/spike/desktop/reaver.desktop /usr/share/spike/desktop/ska.desktop /usr/share/spike/desktop/rfkill.desktop /usr/share/spike/desktop/spectool_curses.desktop /usr/share/spike/desktop/spectool_net.desktop /usr/share/spike/desktop/spectool_gtk.desktop /usr/share/spike/desktop/spectool_raw.desktop /usr/share/spike/desktop/wavemon.desktop /usr/share/spike/desktop/waveselect.desktop /usr/share/spike/desktop/wepattack.desktop /usr/share/spike/desktop/wifi-radar.desktop /usr/share/spike/desktop/wifite.desktop /usr/share/spike/desktop/wepdecrypt.desktop /usr/share/spike/desktop/wifiscanner.desktop /usr/share/spike/desktop/wifitap.desktop /usr/share/spike/desktop/gpsd.desktop

xdg-desktop-menu install --novendor\
                         /usr/share/spike/directory/spike-spike.directory \
                         /usr/share/spike/directory/cracker.directory \
                         /usr/share/spike/desktop/chntpw.desktop /usr/share/spike/desktop/cryptohaze-combined.desktop /usr/share/spike/desktop/cuda-rarcrypt.desktop /usr/share/spike/desktop/hashcat-gui.desktop /usr/share/spike/desktop/hashkill.desktop /usr/share/spike/desktop/john.desktop /usr/share/spike/desktop/md5bf.desktop /usr/share/spike/desktop/oclhashcat.desktop /usr/share/spike/desktop/ophcrack.desktop /usr/share/spike/desktop/plaintoo.desktop /usr/share/spike/desktop/pyrit.desktop /usr/share/spike/desktop/rcracki_mt.desktop /usr/share/spike/desktop/cewl.desktop /usr/share/spike/desktop/authforce.desktop /usr/share/spike/desktop/hydra.desktop /usr/share/spike/desktop/medusa.desktop /usr/share/spike/desktop/ncrack.desktop /usr/share/spike/desktop/thc-pptp-bruter.desktop /usr/share/spike/desktop/rdesktop-brute.desktop /usr/share/spike/desktop/dictionary.desktop

xdg-desktop-menu install --novendor\
                         /usr/share/spike/directory/spike-spike.directory \
                         /usr/share/spike/directory/bluetooth.directory \
                         /usr/share/spike/desktop/libbtbb.desktop /usr/share/spike/desktop/bluemaho.desktop /usr/share/spike/desktop/psm_scan.desktop /usr/share/spike/desktop/rfcomm_scan.desktop /usr/share/spike/desktop/btscanner.desktop /usr/share/spike/desktop/crackle.desktop /usr/share/spike/desktop/gnome-bluetooth.desktop /usr/share/spike/desktop/haraldscan.py.desktop /usr/share/spike/desktop/ubertooth-dump.desktop /usr/share/spike/desktop/ubertooth-dfu.desktop /usr/share/spike/desktop/ubertooth-uap.desktop /usr/share/spike/desktop/ubertooth-hop.desktop /usr/share/spike/desktop/ubertooth-specan-ui.desktop /usr/share/spike/desktop/ubertooth-btle.desktop /usr/share/spike/desktop/ubertooth-lap.desktop /usr/share/spike/desktop/ubertooth-util.desktop

xdg-desktop-menu install --novendor\
                         /usr/share/spike/directory/spike-spike.directory \
                         /usr/share/spike/directory/mobile.directory \
                         /usr/share/spike/desktop/ideviceinstaller.desktop /usr/share/spike/desktop/ifuse.desktop /usr/share/spike/desktop/idevicebackup.desktop /usr/share/spike/desktop/idevicedate.desktop /usr/share/spike/desktop/ideviceenterrecovery.desktop /usr/share/spike/desktop/ideviceimagemounter.desktop /usr/share/spike/desktop/ideviceinfo.desktop /usr/share/spike/desktop/idevicepair.desktop /usr/share/spike/desktop/idevicescreenshot.desktop /usr/share/spike/desktop/idevicesyslog.desktop /usr/share/spike/desktop/apktool.desktop /usr/share/spike/desktop/dex2jar.desktop /usr/share/spike/desktop/jd-gui.desktop /usr/share/spike/desktop/clang.desktop

xdg-desktop-menu install --novendor\
                         /usr/share/spike/directory/spike-spike.directory \
                         /usr/share/spike/directory/misc.directory \
                         /usr/share/spike/desktop/honeyd.desktop /usr/share/spike/desktop/polenum.desktop /usr/share/spike/desktop/snort.desktop /usr/share/spike/desktop/firehol.desktop /usr/share/spike/desktop/sanewall.desktop /usr/share/spike/desktop/ftpd.desktop /usr/share/spike/desktop/oftpd.desktop /usr/share/spike/desktop/curl.desktop /usr/share/spike/desktop/dhcpcd.desktop /usr/share/spike/desktop/etherwake.desktop /usr/share/spike/desktop/iodine.desktop /usr/share/spike/desktop/rdesktop.desktop /usr/share/spike/desktop/stunnel.desktop /usr/share/spike/desktop/vncviewer.desktop /usr/share/spike/desktop/tinc.desktop /usr/share/spike/desktop/tsclient.desktop /usr/share/spike/desktop/whatmask.desktop /usr/share/spike/desktop/whois.desktop /usr/share/spike/desktop/apache.desktop

xdg-desktop-menu install --novendor\
                         /usr/share/spike/directory/spike-spike.directory \
                         /usr/share/spike/directory/sip-voip.directory \
                         /usr/share/spike/desktop/sipcrack.desktop /usr/share/spike/desktop/sipdump.desktop /usr/share/spike/desktop/svmap.desktop /usr/share/spike/desktop/svreport.desktop /usr/share/spike/desktop/svwar.desktop /usr/share/spike/desktop/svcrack.desktop /usr/share/spike/desktop/ucsniff.desktop /usr/share/spike/desktop/videojak.desktop /usr/share/spike/desktop/voiphopper.desktop /usr/share/spike/desktop/vomit.desktop /usr/share/spike/desktop/testcall.desktop /usr/share/spike/desktop/wxiax.desktop /usr/share/spike/desktop/partysip.desktop /usr/share/spike/desktop/sipbomber.desktop /usr/share/spike/desktop/sipp.desktop /usr/share/spike/desktop/siproxd.desktop /usr/share/spike/desktop/sipsak.desktop /usr/share/spike/desktop/voipong.desktop /usr/share/spike/desktop/warvox-launcher.desktop

xdg-desktop-menu install --novendor\
                         /usr/share/spike/directory/spike-spike.directory \
                         /usr/share/spike/directory/fuzzers.directory \
                         /usr/share/spike/desktop/peach.desktop /usr/share/spike/desktop/bed.desktop /usr/share/spike/desktop/bss.desktop /usr/share/spike/desktop/fusil-firefox.desktop /usr/share/spike/desktop/fusil-clamav.desktop /usr/share/spike/desktop/fusil-imagemagick.desktop /usr/share/spike/desktop/fusil-gettext.desktop /usr/share/spike/desktop/fusil-mplayer.desktop /usr/share/spike/desktop/fusil-zzuf.desktop /usr/share/spike/desktop/fusil-ogg123.desktop /usr/share/spike/desktop/fusil-python.desktop /usr/share/spike/desktop/fusil-php.desktop /usr/share/spike/desktop/fusil-vlc.desktop /usr/share/spike/desktop/fusil-libc-printf.desktop /usr/share/spike/desktop/fusil-wizzard.desktop /usr/share/spike/desktop/fusil-poppler.desktop /usr/share/spike/desktop/fusil-gstreamer.desktop /usr/share/spike/desktop/fuzzdb.desktop /usr/share/spike/desktop/fuzzer-server.desktop /usr/share/spike/desktop/http-fuzz.desktop /usr/share/spike/desktop/ohrwurm.desktop /usr/share/spike/desktop/protos.desktop /usr/share/spike/desktop/scapy.desktop /usr/share/spike/desktop/slowhttptest.desktop /usr/share/spike/desktop/smtp-fuzz.desktop /usr/share/spike/desktop/smudge.desktop /usr/share/spike/desktop/snmp-fuzzer.desktop /usr/share/spike/desktop/taof.desktop

xdg-desktop-menu install --novendor\
                         /usr/share/spike/directory/spike-spike.directory \
                         /usr/share/spike/directory/footprint.directory \
                         /usr/share/spike/desktop/amap.desktop /usr/share/spike/desktop/fierce.pl.desktop /usr/share/spike/desktop/geoedge.desktop /usr/share/spike/desktop/metagoofil.desktop /usr/share/spike/desktop/ntp-fingerprint.desktop /usr/share/spike/desktop/p0f.desktop /usr/share/spike/desktop/scanssh.desktop /usr/share/spike/desktop/siphon.desktop /usr/share/spike/desktop/smtpmap.desktop /usr/share/spike/desktop/subdomainer.desktop /usr/share/spike/desktop/theHarvester.py.desktop /usr/share/spike/desktop/wafw00f.py.desktop /usr/share/spike/desktop/wafp.desktop /usr/share/spike/desktop/wfuzz.desktop /usr/share/spike/desktop/whatweb.desktop /usr/share/spike/desktop/xprobe2.desktop

xdg-desktop-menu install --novendor\
                         /usr/share/spike/directory/spike-spike.directory \
                         /usr/share/spike/directory/database.directory \
                         /usr/share/spike/desktop/absinthe.desktop /usr/share/spike/desktop/minimysqlator.desktop /usr/share/spike/desktop/mssqlscan.desktop /usr/share/spike/desktop/otnsctl.sh.desktop /usr/share/spike/desktop/oquery.sh.desktop /usr/share/spike/desktop/osd.sh.desktop /usr/share/spike/desktop/ose.sh.desktop /usr/share/spike/desktop/opwg.sh.desktop /usr/share/spike/desktop/sqid.rb.desktop /usr/share/spike/desktop/sqlbf.desktop /usr/share/spike/desktop/sqlibf.desktop /usr/share/spike/desktop/sqlitebrowser.desktop /usr/share/spike/desktop/sqlix.desktop /usr/share/spike/desktop/sqlmap.desktop /usr/share/spike/desktop/metacoretex-ng.desktop /usr/share/spike/desktop/sqlninja.desktop

xdg-desktop-menu install --novendor\
                         /usr/share/spike/directory/spike-spike.directory \
                         /usr/share/spike/directory/exploit.directory \
                         /usr/share/spike/desktop/packetstormexploits.desktop /usr/share/spike/desktop/shellstorm.py.desktop /usr/share/spike/desktop/make-pdf-javascript.desktop /usr/share/spike/desktop/make-pdf-embedded.desktop /usr/share/spike/desktop/davtest.pl.desktop /usr/share/spike/desktop/fasttrack.desktop fasttrack-gui.desktop /usr/share/spike/desktop/inguma.desktop /usr/share/spike/desktop/msf-console.desktop armitage.desktop /usr/share/spike/desktop/mosref mosref-src.desktop /usr/share/spike/desktop/setoolkit.desktop /usr/share/spike/desktop/set-web.desktop /usr/share/spike/desktop/set-automate.desktop /usr/share/spike/desktop/set-proxy.desktop /usr/share/spike/desktop/upnpwn.desktop /usr/share/spike/desktop/w3af_gui.desktop w3af_console /usr/share/spike/desktop/yersinia-gui.desktop yersinia-cmd.desktop /usr/share/spike/desktop/winexe.desktop /usr/share/spike/desktop/raccess.desktop /usr/share/spike/desktop/beef.desktop

xdg-desktop-menu install --novendor\
                         /usr/share/spike/directory/spike-spike.directory \
                         /usr/share/spike/directory/proxy.directory \
                         /usr/share/spike/desktop/proxychains.desktop /usr/share/spike/desktop/3proxy.desktop /usr/share/spike/desktop/burpsuite.desktop /usr/share/spike/desktop/httpush.desktop /usr/share/spike/desktop/paros.desktop /usr/share/spike/desktop/vidalia.desktop /usr/share/spike/desktop/proxystrike-gui.desktop /usr/share/spike/desktop/ratproxy.desktop /usr/share/spike/desktop/ratproxy-report.sh.desktop /usr/share/spike/desktop/webscarab.desktop /usr/share/spike/desktop/tsocks.desktop /usr/share/spike/desktop/zaproxy.desktop

xdg-desktop-menu install --novendor\
                         /usr/share/spike/directory/spike-spike.directory \
                         /usr/share/spike/directory/radio.directory \
                         /usr/share/spike/desktop/fldigi.desktop /usr/share/spike/desktop/gr-baz.desktop /usr/share/spike/desktop/virtualradar.desktop /usr/share/spike/desktop/multimode.desktop /usr/share/spike/desktop/modes_rx.desktop /usr/share/spike/desktop/rtl_adsb.desktop /usr/share/spike/desktop/rtl_eeprom.desktop /usr/share/spike/desktop/rtl_fm.desktop /usr/share/spike/desktop/rtl_power.desktop /usr/share/spike/desktop/rtl_sdr.desktop /usr/share/spike/desktop/rtl_tcp.desktop /usr/share/spike/desktop/rtl_test.desktop

xdg-desktop-menu install --novendor\
                         /usr/share/spike/directory/spike-spike.directory \
                         /usr/share/spike/directory/forging.directory \
                         /usr/share/spike/desktop/fragroute.desktop /usr/share/spike/desktop/gspoof.desktop /usr/share/spike/desktop/hping2.desktop /usr/share/spike/desktop/hping3.desktop /usr/share/spike/desktop/hyenae.desktop /usr/share/spike/desktop/isic.desktop /usr/share/spike/desktop/macchanger.desktop /usr/share/spike/desktop/maketh.desktop /usr/share/spike/desktop/netwag.desktop /usr/share/spike/desktop/packit.desktop /usr/share/spike/desktop/rain.desktop /usr/share/spike/desktop/ipsorcery.desktop /usr/share/spike/desktop/nemesis.desktop

xdg-desktop-menu install --novendor\
                         /usr/share/spike/directory/spike-spike.directory \
                         /usr/share/spike/directory/analyzer.directory \
                         /usr/share/spike/desktop/aimsniff.desktop /usr/share/spike/desktop/angst.desktop /usr/share/spike/desktop/arpantispoofer.desktop /usr/share/spike/desktop/arpwatch.desktop /usr/share/spike/desktop/bmon.desktop /usr/share/spike/desktop/chaosreader.desktop /usr/share/spike/desktop/dnsa.desktop /usr/share/spike/desktop/dnsenum.desktop /usr/share/spike/desktop/dnstracer.desktop /usr/share/spike/desktop/driftnet.desktop /usr/share/spike/desktop/etherape.desktop /usr/share/spike/desktop/ftest.desktop /usr/share/spike/desktop/gnome-nettool.desktop /usr/share/spike/desktop/mbrowse.desktop /usr/share/spike/desktop/nc6.desktop /usr/share/spike/desktop/netdiscover.desktop /usr/share/spike/desktop/netdude.desktop /usr/share/spike/desktop/netmap.desktop /usr/share/spike/desktop/ngrep.desktop /usr/share/spike/desktop/ntop.desktop /usr/share/spike/desktop/lc.desktop /usr/share/spike/desktop/minewt.desktop /usr/share/spike/desktop/paratrace.desktop /usr/share/spike/desktop/sniffit.desktop /usr/share/spike/desktop/snmpenum.desktop /usr/share/spike/desktop/ssltest.desktop /usr/share/spike/desktop/tcpdump.desktop /usr/share/spike/desktop/tcpreplay.desktop /usr/share/spike/desktop/tcptraceroute.desktop /usr/share/spike/desktop/address6.desktop /usr/share/spike/desktop/alive6.desktop /usr/share/spike/desktop/covert_send6.desktop /usr/share/spike/desktop/covert_send6d.desktop /usr/share/spike/desktop/denial6.desktop /usr/share/spike/desktop/detect-new-ip6.desktop /usr/share/spike/desktop/detect_sniffer6.desktop /usr/share/spike/desktop/dnsdict6.desktop /usr/share/spike/desktop/dnsrevenum6.desktop /usr/share/spike/desktop/dos-new-ip6.desktop /usr/share/spike/desktop/dos_mld.sh.desktop /usr/share/spike/desktop/dump_router6.desktop /usr/share/spike/desktop/exploit6.desktop /usr/share/spike/desktop/extract_hosts6.sh.desktop /usr/share/spike/desktop/extract_networks6.sh.desktop /usr/share/spike/desktop/fake_advertise6.desktop /usr/share/spike/desktop/fake_dhcps6.desktop /usr/share/spike/desktop/fake_dns6d.desktop /usr/share/spike/desktop/fake_dnsupdate6.desktop /usr/share/spike/desktop/fake_mipv6.desktop /usr/share/spike/desktop/fake_mld26.desktop /usr/share/spike/desktop/fake_mld6.desktop /usr/share/spike/desktop/fake_mldrouter6.desktop /usr/share/spike/desktop/fake_router26.desktop /usr/share/spike/desktop/fake_router6.desktop /usr/share/spike/desktop/fake_solicitate6.desktop /usr/share/spike/desktop/flood_advertise6.desktop /usr/share/spike/desktop/flood_dhcpc6.desktop /usr/share/spike/desktop/flood_mld26.desktop /usr/share/spike/desktop/flood_mld6.desktop /usr/share/spike/desktop/flood_mldrouter6.desktop /usr/share/spike/desktop/flood_router26.desktop /usr/share/spike/desktop/flood_router6.desktop /usr/share/spike/desktop/flood_solicitate6.desktop /usr/share/spike/desktop/fragmentation6.desktop /usr/share/spike/desktop/fuzz_ip6.desktop /usr/share/spike/desktop/implementation6.desktop /usr/share/spike/desktop/implementation6d.desktop /usr/share/spike/desktop/inverse_lookup6.desktop /usr/share/spike/desktop/kill_router6.desktop /usr/share/spike/desktop/ndpexhaust6.desktop /usr/share/spike/desktop/node_query6.desktop /usr/share/spike/desktop/parasite6.desktop /usr/share/spike/desktop/passive_discovery6.desktop /usr/share/spike/desktop/randicmp6.desktop /usr/share/spike/desktop/redir6.desktop /usr/share/spike/desktop/rsmurf6.desktop /usr/share/spike/desktop/sendpees6.desktop /usr/share/spike/desktop/sendpeesmp6.desktop /usr/share/spike/desktop/smurf6.desktop /usr/share/spike/desktop/thcping6.desktop /usr/share/spike/desktop/toobig6.desktop /usr/share/spike/desktop/trace6.desktop /usr/share/spike/desktop/thcrut.desktop /usr/share/spike/desktop/traceroute.desktop /usr/share/spike/desktop/wireshark.desktop /usr/share/spike/desktop/xplico.desktop /usr/share/spike/desktop/socat.desktop /usr/share/spike/desktop/gq.desktop /usr/share/spike/desktop/jxplorer.desktop /usr/share/spike/desktop/lat.desktop

xdg-desktop-menu install --novendor /usr/share/spike/directory/spike-spike.directory '/usr/share/spike/desktop/Get Live Help.desktop'


	fi

	fdo-mime_desktop_database_update
}

pkg_prerm() {
	if [ -x "/usr/bin/xdg-desktop-menu" ]; then
		xdg-desktop-menu uninstall /usr/share/spike/directory/*.directory /usr/share/spike/desktop/*.desktop
	fi
}
