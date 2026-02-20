# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=pumba
pkgver=0.12.3
pkgrel=1
pkgdesc="Chaos testing, network emulation and stress testing tool for containers"
arch=('x86_64')
url="https://github.com/alexei-led/pumba"
license=('Apache-2.0')
makedepends=('go' 'git' 'golangci-lint')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e9907dc43091b85683a4c3b52b0e4bf94ca821618ab21dda212e069ce455b19e')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-trimpath"
  make
}

test() {
  cd "$pkgname-$pkgver"
  make test-coverage
}

package() {
  cd "$pkgname-$pkgver"
  make release
  install -Dm755 .bin/${pkgname}_linux_amd64 "$pkgdir"/usr/bin/$pkgname
}
