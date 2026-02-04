# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=paqet
pkgver=1.0.0_alpha.13
pkgrel=1
pkgdesc="Ferries Packets Across Forbidden Boundaries"
arch=("any")
url="https://github.com/hanselime/paqet"
license=("MIT")
makedepends=("git" "go")
source=("git+${url}.git#tag=v${pkgver//_/-}")
sha256sums=('fe9c22f26c2184711638bad1850dd3178366e666228a4d2216137dd1502d8c20')

build() {
  cd "${srcdir}/${pkgname}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o paqet_${pkgver//_/-}-${pkgrel} ./cmd/main.go
}

package() {
    cd "${srcdir}/${pkgname}"
    install -D -m 755 "paqet_${pkgver//_/-}-${pkgrel}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
