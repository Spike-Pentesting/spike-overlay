# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-apps/jekyll-sitemap/jekyll-sitemap-0.8.1.ebuild,v 1.1 2015/03/15 14:49:30 mrueg Exp $

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_RECIPE_TEST=""
RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="Jekyll plugin that generates galleries from directories full of images"
HOMEPAGE="https://github.com/ggreer/jekyll-gallery-generator"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/exifr-1.2
	>=dev-ruby/rmagick-2.12
	>=www-apps/jekyll-2"
