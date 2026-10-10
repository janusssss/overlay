# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit linux-info

DESCRIPTION="LLMNR (RFC 4795) responder daemon for Linux"
HOMEPAGE="https://github.com/tklauser/llmnrd"
SRC_URI="https://github.com/tklauser/llmnrd/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

CONFIG_CHECK="~NETLINK_DIAG"

src_compile() {
	emake prefix=/usr
}
src_install() {
	emake DESTDIR="${D}" prefix=/usr install
	newinitd "${FILESDIR}"/llmnrd.initd llmnrd
}
