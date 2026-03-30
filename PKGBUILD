# Maintainer: Amin Vakil <info AT aminvakil DOT com>

_pkgname=SlipNet
pkgname=slipnet
pkgver=2.4.1
pkgrel=1
pkgdesc="Android VPN client with DNS tunneling (DNSTT, NoizDNS & Slipstream), NaiveProxy, SSH, Tor, and DoH support — featuring a built-in DNS scanner. "
arch=('aarch64' 'x86_64')
url="https://github.com/anonvector/SlipNet"
license=('custom')
makedepends=('go' 'git')
source=("git+${url}/#tag=v${pkgver}")
sha256sums=('3332a3dc4394af34ddab9d1342a490c65b55d268caa0db3feed57d8ae52a92f7')

prepare(){
  cd "${_pkgname}/cli"
  git submodule update --init
  export GOPATH="${srcdir}"
  go mod download -modcacherw
}

build() {
  cd "${_pkgname}/cli"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o slipnet-${pkgver}-linux-amd64 main.go
}

package() {
  cd "${_pkgname}/cli"
  install -Dm0755 slipnet-${pkgver}-linux-amd64 "$pkgdir"/usr/bin/${pkgname}
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
