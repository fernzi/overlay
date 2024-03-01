# Copyright © 2024 Fern Zapata
# This program is subject to the terms of the GNU GPL, version 3
# or, at your option, any later version. If a copy of it was not
# included with this file, see https://www.gnu.org/licenses/.

EAPI=8

inherit linux-info toolchain-funcs

MY_P="${PN}-v${PV}"

DESCRIPTION="File-based build system"
HOMEPAGE="https://gittup.org/tup/"
SRC_URI="https://gittup.org/tup/releases/${MY_P}.tar.gz"
S="${WORKDIR}/${MY_P}"

LICENSE="GPL-2 MIT public-domain BSD BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
RESTRICT="mirror"

DEPEND="
	dev-db/sqlite
	dev-libs/libpcre
	sys-fs/fuse:3
"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

CONFIG_CHECK="
	~FUSE_FS
	~NAMESPACES
"

src_prepare() {
	default
	sed -i "s/\`git describe\`/${PV}/" src/tup/link.sh || die
	cat >> tup.config <<EOF
CONFIG_TUP_USE_SYSTEM_SQLITE=y
CONFIG_CC=$(tc-getCC)
CONFIG_AR=$(tc-getAR)
EOF
	cat >> Tuprules.tup <<EOF
CFLAGS += ${CFLAGS}
LDFLAGS += ${LDFLAGS}
EOF
}

src_compile() {
	TUP_NO_NAMESPACING=1 ./bootstrap-nofuse.sh || die
}

src_install() {
	dobin tup
	dolib.a libtup_client.a
	doheader tup_client.h
	doman tup.1
}
