# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI="5"
KEYWORDS="~amd64 ~arm ~x86"
DESCRIPTION="Spike meta-ebuild"
HOMEPAGE="http://www.spike-pentesting.org"
SLOT="0"
LICENSE="GPL-3"
IUSE=""
S="${WORKDIR}"
GCC_VER="4.8"
PYTHON_VER="2.7"
DEPEND="
	app-admin/eselect-metasploit
	app-antivirus/malheur
	app-cdr/dumpet
	app-crypt/SIPcrack
	app-crypt/WiRouterKeyRec
	app-crypt/asleap
	app-crypt/cpyrit_cuda
	app-crypt/hashkill
	app-crypt/oclhashcat-plus-bin
	app-crypt/pyrit
	app-crypt/rcracki_mt
	app-crypt/samdump2
	app-crypt/steghide
	app-dicts/raft-wordlists
	app-emulation/virt-viewer
	app-exploits/exploitdb
	app-exploits/packetstormexploits
	app-exploits/packetstormexploits-meta
	app-exploits/shellstorm
	app-exploits/weevely
	app-forensics/dff
	app-forensics/disitool
	app-forensics/inception
	app-forensics/libforensic1394
	app-forensics/libpff
	app-forensics/libvshadow
	app-forensics/make-pdf
	app-forensics/pdf-parser
	app-forensics/pdfid
	app-forensics/stegdetect
	app-forensics/streams
	app-forensics/tcpxtract
	app-forensics/volatility
	app-forensics/yara
	app-forensics/yim2text
	app-fuzz/Peach
	app-fuzz/bed
	app-fuzz/bss
	app-fuzz/dotdotpwn
	app-fuzz/fuzzdb
	app-fuzz/fuzzer-server
	app-fuzz/http-fuzz
	app-fuzz/ohrwurm
	app-fuzz/slowhttptest
	app-fuzz/smtp-fuzz
	app-i18n/scim
	app-misc/crunch
	app-misc/ddate
	app-misc/dradis
	app-misc/libmsr
	dev-db/minimysqlator
	dev-db/mssqlscan
	dev-db/oat
	dev-db/sqid
	dev-db/sqlbf
	dev-db/sqlibf
	dev-db/sqlix
	dev-db/sqlmap
	dev-db/sqlsus
	dev-db/themole
	dev-util/apktool
	dev-util/ati-app-sdk-bin
	dev-util/bokken
	dev-util/capstone
	dev-util/collabreate
	dev-util/dex2jar
	dev-util/radare2
	net-analyzer/armitage
	net-analyzer/arpantispoofer
	net-analyzer/bro
	net-analyzer/cisco-auditing-tool
	net-analyzer/cisco-bruteforce-enabler
	net-analyzer/cisco-scanner
	net-analyzer/cisco-torch
	net-analyzer/davtest
	net-analyzer/dnsa
	net-analyzer/dnsrecon
	net-analyzer/dnsenum
	net-analyzer/enum4linux
	net-analyzer/evilgrade
	net-analyzer/fierce
	net-analyzer/geoedge
	net-analyzer/geoipgen
	net-analyzer/httprint
	net-analyzer/hyenae
	net-analyzer/inguma
	net-analyzer/jmsdigger-bin
	net-analyzer/loki
	net-analyzer/maketh
	net-analyzer/masscan
	net-analyzer/metasploit
	net-analyzer/nacker
	net-analyzer/netmap
	net-analyzer/nmap_vulscan
	net-analyzer/ntp-fingerprint
	net-analyzer/onesixtyone
	net-analyzer/padbuster
	net-analyzer/plecost
	net-analyzer/polenum
	net-analyzer/post-it-dos
	net-analyzer/ppscan
	net-analyzer/recon-ng
	net-analyzer/rpcapd
	net-analyzer/sessionlist
	net-analyzer/set
	net-analyzer/sipvicious
	net-analyzer/smtpmap
	net-analyzer/snmpenum
	net-analyzer/sqlninja
	net-analyzer/sslcat
	net-analyzer/sslscan
	net-analyzer/sslstrip
	net-analyzer/ssltest
	net-analyzer/sslyze
	net-analyzer/subdomainer
	net-analyzer/suricata
	net-analyzer/thc-pptp-bruter
	net-analyzer/thc-ssl-dos
	net-analyzer/theHarvester
	net-analyzer/upnpwn
	net-analyzer/voiphopper
	net-analyzer/waffit
	net-analyzer/wafp
	net-analyzer/wapiti
	net-analyzer/w3af
	net-analyzer/webshag
	net-analyzer/wfuzz
	net-analyzer/whatweb
	net-analyzer/wolpertinger
	net-analyzer/wpscan
	net-analyzer/xplico
	net-analyzer/zarp
	net-fs/afpfs-ng
	net-misc/badvpn
	net-misc/bfgminer
	net-misc/brutessh
	net-misc/edgessh
	net-misc/f5vpn-login
	net-misc/faifa
	net-misc/fwknop
	net-misc/karma
	net-misc/ngrok
	net-misc/rdesktop-brute
	net-misc/sipp
	net-misc/httpfs
	net-misc/sslh
	net-misc/t50
	net-misc/tcpick
	net-misc/voipong
	net-misc/wlan2eth
	net-proxy/3proxy
	net-proxy/burpsuite
	net-proxy/hosproxy
	net-proxy/mitmproxy
	net-proxy/pbounce
	net-proxy/proxystrike
	net-proxy/pwnat
	net-proxy/redsocks
	net-proxy/sshttp
	net-proxy/zaproxy
	net-wireless/bt-audit
	net-wireless/btscanner
	net-wireless/bully
	net-wireless/cowpatty
	net-wireless/fern-wifi-cracker
	net-wireless/grimwepa
	net-wireless/haraldscan
	net-wireless/horst
	net-wireless/karmetasploit
	net-wireless/killerbee
	net-wireless/mfoc
	net-wireless/morse2txt
	net-wireless/reaver
	net-wireless/rfidtool
	net-wireless/virtualradar-bin
	net-wireless/wifite
	spike/spike-skel
	spike/spike-version
	spike/spike-menu
	sys-apps/become
	www-apps/arachni
	www-apps/beef
	www-misc/xsser
"
#net-wireless/ska e net-wireless/afrag net-fs/winexe net-wireless/mfoc removed
RDEPEND="${DEPEND}
	!app-admin/eselect-init
	!<sys-apps/sysvinit-1000
	!sys-apps/hal
	!sys-auth/consolekit
	app-admin/eselect-python
	dev-lang/python:${PYTHON_VER}
	sys-apps/systemd
	sys-apps/systemd-sysv-utils
	sys-devel/base-gcc:${GCC_VER}
	sys-devel/gcc-config"

src_unpack () {
	echo "Spike Pentesting Linux ${ARCH} ${PV}" > "${T}/sabayon-release"

	# Anaconda expects a "release" somewhere in the string
	# and no trailing \n
	echo -n "Spike ${ARCH} release ${PV}" > "${T}/system-release"
	mkdir -p "${S}" || die
}

src_install () {
	insinto /etc
	doins "${T}"/sabayon-release
	doins "${T}"/system-release

	# Bug 3459 - reduce the risk of fork bombs
	insinto /etc/security/limits.d
	doins "${FILESDIR}/00-sabayon-anti-fork-bomb.conf"
}

pkg_postinst() {
	# Setup Python ${PYTHON_VER}
	eselect python set python${PYTHON_VER}
	# No need to set the GCC profile here, since it's done in base-gcc

	# Improve systemd support
	if [[ ! -L /etc/mtab ]] && [[ -e /proc/self/mounts ]]; then
		rm -f /etc/mtab
		einfo "Migrating /etc/mtab to a /proc/self/mounts symlink"
		ln -sf /proc/self/mounts /etc/mtab
	fi

	# force kdm back to the default runlevel if added to boot
	# this is in preparation for the logind migration
	local xdm_conf="${ROOT}/etc/conf.d/xdm"
	local xdm_boot_runlevel="${ROOT}/etc/runlevels/boot/xdm"
	local xdm_default_runlevel="${ROOT}/etc/runlevels/default/xdm"
	if [ -e "${xdm_conf}" ] && [ -e "${xdm_boot_runlevel}" ]; then
		DISPLAYMANAGER=""
		. "${xdm_conf}"
		if [ "${DISPLAYMANAGER}" = "kdm" ]; then
			elog "Moving xdm (kdm) from boot runlevel to default"
			elog "or logind will not work as expected"
			mv -f "${xdm_boot_runlevel}" "${xdm_default_runlevel}"
		fi
	fi

	# remove old hal udev rules.d file, if found. sys-apps/hal is long gone.
	rm -f "${ROOT}/lib/udev/rules.d/90-hal.rules"

	# make sure that systemd is correctly linked to /sbin/init
	# Drop this in 2015, keep in sync with systemd-sysv-utils
	ln -sf ../usr/lib/systemd/systemd "${ROOT}/sbin/init" || true
}