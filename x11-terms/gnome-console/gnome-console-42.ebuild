# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit gnome.org gnome2-utils meson xdg

DESCRIPTION="A terminal emulator for GNOME"
HOMEPAGE="https://apps.gnome.org/app/org.gnome.Console/ https://gitlab.gnome.org/GNOME/console"

SRC_URI="https://gitlab.gnome.org/GNOME/console/-/archive/${PV}.beta/console-${PV}.beta.tar.gz ${S}"

LICENSE="GPL-3+"
SLOT="0"
IUSE="debug +nautilus"

KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~ia64 ~mips ~ppc ~ppc64 ~riscv ~sparc ~x86 ~amd64-linux ~x86-linux"

RDEPEND="
"
DEPEND="${RDEPEND}"
# itstool required for help/* with non-en LINGUAS, see bug #549358
# xmllint required for glib-compile-resources, see bug #549304
BDEPEND="
"

src_configure() {
	local emesonargs=(
		$(meson_use debug devel)
		$(meson_feature nautilus nautilus)
	)
	meson_src_configure
}

src_install() {
	meson_src_install
}

pkg_postinst() {
	xdg_pkg_postinst
	gnome2_schemas_update
}

pkg_postrm() {
	xdg_pkg_postrm
	gnome2_schemas_update
}
