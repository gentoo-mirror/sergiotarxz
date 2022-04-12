# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

inherit meson

DESCRIPTION="A free software manga reader."
HOMEPAGE="https://gitea.sergiotarxz.freemyip.com"
SRC_URI="https://gitea.sergiotarxz.freemyip.com/sergiotarxz/mangareader/archive/v${PV}.tar.gz -> openmg-$PV.tar.gz"
S="mangareader"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
>=dev-libs/glib-2.64:2
>=gui-libs/libadwaita-1.1.0
>=net-libs/libsoup-2.74.2
>=gui-libs/gtk-4.6.1
>=dev-db/sqlite-3.38.0
"

RDEPEND="${DEPEND}"
BDEPEND="
virtual/pkgconfig
>=dev-util/meson-0.60.3
"

src_configure() {
	meson_src_configure
}

src_install() {
	meson_src_install
}
