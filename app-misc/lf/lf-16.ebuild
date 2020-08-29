EAPI=7

inherit go-module

DESCRIPTION="Terminal file manager"
HOMEPAGE="https://github.com/gokcehan/lf"

EGO_SUM=(
	"github.com/doronbehar/termbox-go v0.0.0-20200711071547-71407e3bfa14"
	"github.com/doronbehar/termbox-go v0.0.0-20200711071547-71407e3bfa14/go.mod"
	"github.com/mattn/go-runewidth v0.0.9"
	"github.com/mattn/go-runewidth v0.0.9/go.mod"
	"gopkg.in/djherbis/times.v1 v1.2.0"
	"gopkg.in/djherbis/times.v1 v1.2.0/go.mod"
)
go-module_set_globals

SRC_URI="
	https://github.com/gokcehan/${PN}/archive/r${PV}.tar.gz -> ${P}.tgz
	${EGO_SUM_SRC_URI}
"

S="${WORKDIR}/${PN}-r${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"
IUSE="fish-completion zsh-completion"

RDEPEND="
	fish-completion? ( app-shells/fish )
	zsh-completion? ( app-shells/zsh )
"

DOCS=(
	README.md
	etc/lfrc.example
)

src_compile() {
	go build -o ${PN} -ldflags="-s -w -X main.gVersion=r${PV}"
}

src_install() {
	dobin ${PN}
	doman ${PN}.1
	einstalldocs
	if use fish-completion; then
		insinto /usr/share/fish/vendor_completions.d
		doins etc/lf.fish
	fi
	if use zsh-completion; then
		insinto /usr/share/zsh/site-functions
		newins etc/lf.zsh _lf
	fi
}
