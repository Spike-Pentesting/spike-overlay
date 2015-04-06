# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: ~~Necrose99 Spike-pentesting.org https://github.com/Sabayon-Labs/spike-community-overlay

EAPI="5"

DESCRIPTION="This module is used to exploit startup script execution of windows GPOL. on SMB shares "
HOMEPAGE="https://github.com/GDSSecurity/BadSamba"
SRC_URI=""
EGIT_REPO_URI="https://github.com/GDSSecurity/BadSamba.git"
#SRC_URI="https://raw.githubusercontent.com/GDSSecurity/BadSamba/master/badsamba.rb"
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""

RUBY_FAKEGEM_EXTRAINSTALL="BadSamba"

inherit ruby-fakegem git-r3
LICENSE="GPL-3"
LICENSE="BSD"
SLOT="$(get_version_component_range 1-2)"
KEYWORDS="~amd64 ~arm ~x86"
#IUSE="development test"
IUSE=""

RDEPEND="${RDEPEND} !dev-ruby/meterpreter_bins:0
net-analyzer/metasploit:0"
##   my first gem ebuild so give me a break... **HELP/MENTORING :-)  Appreciated :-) 
