# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Core configuration files of Grml"
HOMEPAGE="http://git.grml.org/?p=grml-etc-core.git"

if [[ ${PV} = *9999 ]]; then
	inherit git-r3
	KEYWORDS=""
	EGIT_REPO_URI="git://git.grml.org/grml-etc-core.git"
else
	KEYWORDS="~amd64 ~arm"
	SRC_URI="http://deb.grml.org/pool/main/g/${PN}/${PN}_${PV}.tar.gz"
fi
LICENSE="GPL-2"
SLOT="0"
IUSE="+git +tmux +vim +zsh"

src_install() {
	insinto /etc
	use git && newins etc/skel/.gitconfig gitconfig
	use tmux && doins etc/tmux.conf
	insinto /etc/vim
	use vim && doins etc/vim/vimrc
	insinto /etc/zsh
	use zsh && doins etc/zsh/zshrc
}
