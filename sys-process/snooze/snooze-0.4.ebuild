EAPI=7

DESCRIPTION="Run a command at a particular time"
HOMEPAGE="https://github.com/leahneukirchen/snooze"
SRC_URI="https://github.com/leahneukirchen/${PN}/archive/v${PV}.tar.gz -> ${P}.tgz"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

DOCS=(
	README.md
	NEWS.md
)

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
	einstalldocs
}
