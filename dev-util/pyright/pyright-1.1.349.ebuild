# Copyright © 2024 Fern Zapata
# This program is subject to the terms of the GNU GPL, version 3
# or, at your option, any later version. If a copy of it was not
# included with this file, see https://www.gnu.org/licenses/.

EAPI=8

DESCRIPTION="Static type checker for Python"
HOMEPAGE="https://github.com/microsoft/pyright"
SRC_URI="mirror://npm/${PN}/-/${P}.tgz"
S="${WORKDIR}/package"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
RESTRICT="mirror"

RDEPEND="
	net-libs/nodejs
"
BDEPEND="
	net-libs/nodejs[npm]
"

src_install() {
	local myopts=(
		--audit false
		--color false
		--foreground-scripts
		--global
		--offline
		--omit dev
		--prefix "${ED}/usr"
		--progress false
		--verbose
	)
	npm "${myopts[@]}" install "${DISTDIR}/${P}.tgz" ||
		die "npm install failed"
	dodoc *.md
}
