EAPI=7

inherit autotools

DESCRIPTION="Simple UEFI boot manager"
HOMEPAGE="https://pkgs.alpinelinux.org/package/edge/main/x86_64/gummiboot"
LICENSE="LGPL-2+"

SRC_URI="
	https://dev.alpinelinux.org/archive/${PN}/${P}.tar.gz
	https://git.alpinelinux.org/aports/plain/main/${PN}/${PN}-aarch64-support.patch
	https://git.alpinelinux.org/aports/plain/main/${PN}/sysmacros.patch -> ${P}-sysmacros.patch
	https://github.com/void-linux/void-packages/raw/master/srcpkgs/${PN}/patches/stub.patch -> ${P}-stub.patch
"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

DEPEND="
	sys-boot/gnu-efi
"
BDEPEND="
	app-text/docbook-xml-dtd
	dev-libs/libxslt
"

DOCS=(
	README
)
PATCHES=(
	"${DISTDIR}/${P}-sysmacros.patch"
	"${DISTDIR}/${PN}-aarch64-support.patch"
)

src_prepare() {
	default
	eapply -p0 "${DISTDIR}/${P}-stub.patch"
	eautoreconf
}
