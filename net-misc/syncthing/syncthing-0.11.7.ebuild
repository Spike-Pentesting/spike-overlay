EAPI=5
inherit git-2
inherit user

DESCRIPTION="A dropbox-like file synchronization tool"
HOMEPAGE="https://github.com/syncthing/syncthing"
SRC_URI=""

EGIT_REPO_URI="https://github.com/syncthing/syncthing"
EGIT_COMMIT="v${PV}"

LICENSE="MPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
DEPEND="dev-lang/go"

_DEST=${WORKDIR}/src/github.com/syncthing

src_compile() {
	ebegin "Building syncthing ${EGIT_COMMIT}"
	mkdir -p ${_DEST}

	ln -s ${WORKDIR}/syncthing-${PV} ${_DEST}/syncthing
	GOPATH=${WORKDIR} go run ${_DEST}/syncthing/build.go
	eend ${?}
}

src_install() {
	ebegin "Installing syncthing"
	dobin ${_DEST}/syncthing/bin/stcompdirs
	dobin ${_DEST}/syncthing/bin/stevents
	dobin ${_DEST}/syncthing/bin/stfileinfo
	dobin ${_DEST}/syncthing/bin/stfinddevice
	dobin ${_DEST}/syncthing/bin/stindex
	dobin ${_DEST}/syncthing/bin/syncthing

	doman ${_DEST}/syncthing/man/syncthing.1
	doman ${_DEST}/syncthing/man/syncthing-device-ids.7
	doman ${_DEST}/syncthing/man/syncthing-faq.7
	doman ${_DEST}/syncthing/man/syncthing-rest-api.7
	doman ${_DEST}/syncthing/man/syncthing-stignore.5
	doman ${_DEST}/syncthing/man/syncthing-config.5
	doman ${_DEST}/syncthing/man/syncthing-event-api.7
	doman ${_DEST}/syncthing/man/syncthing-networking.7
	doman ${_DEST}/syncthing/man/syncthing-security.7
	doman ${_DEST}/syncthing/man/syncthing-versioning.7
	newinitd "${FILESDIR}"/syncthing.initd syncthing
	newconfd "${FILESDIR}"/syncthing.conf syncthing
	echo "Created /etc/init.d/syncthing to launch on startup"
	echo "If you want to use this, edit /etc/conf.d/syncthing and set the USER variable to your user name."
	echo "Then run"
	echo "	rc-update add syncthing default"
	echo "to enable it on startup"
	echo ""
	echo "Once syncthing is running, go to http://localhost:8384/ to set up files to synchronize."
    eend ${?}
}

pkg_postinst() {
	ebegin "Creating /etc/init.d/syncthing"
	eend ${?}
}
