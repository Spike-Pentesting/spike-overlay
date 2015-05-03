#!/sbin/runscript
# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

PIDFILE=/run/radicale.pid

depend() {
    use net
    need localmount
}

start() {
    ebegin "Starting radicale"
        start-stop-daemon --start --quiet --background \
        --user radicale \
        --pidfile ${PIDFILE} --make-pidfile \
        --exec /usr/bin/radicale -- --foreground
    eend $?
}

stop() {
    ebegin "Stopping radicale"
        start-stop-daemon --stop --quiet \
        --pidfile ${PIDFILE}
    eend $?
}
