# Maintainer: Amin Vakil <info AT aminvakil DOT com>

_pkgname=sentry-relay
pkgname=sentry-relay-git
pkgver=r6036.1841aafc17
pkgrel=1
pkgdesc="Sentry relay"
url="https://github.com/getsentry/relay"
license=("Apache-2.0")
makedepends=("git" "cargo" "cmake")
depends=('zlib' 'gcc-libs')
arch=("x86_64")
source=("relay::git+${url}.git"
        "sentry-relay.service")
sha512sums=('SKIP'
            '849b2fd41dad7f89b47fdba2729e83d92a6bfa63e9bd5507607d7c4cf498e051a14f07597f2cc6f415297ecb94a8619d21f370d2f38d04c5fa993e5c5d691cb6')
provides=("sentry-relay")
conflicts=("sentry-relay")
options=(!lto)

pkgver() {
    cd "relay"

    # Get the version number.
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "relay"
  git submodule update --init
}

build() {
  cd "relay/relay"
  export RELAY_RELEASE=$pkgver
  export RUSTFLAGS="$RUSTFLAGS --cfg tokio_unstable"
  unset CFLAGS
  unset LDFLAGS
  cargo fetch --locked --target "$(rustc --print host-tuple)"
  cargo build --frozen --release
}

package() {
  cd "relay"
  install -Dm0755 target/release/relay "$pkgdir/usr/bin/sentry-relay"
  install -Dm0644 LICENSE.md "$pkgdir/usr/share/licenses/sentry-relay/LICENSE.md"
  install -Dm0644 "${srcdir}/sentry-relay.service" "${pkgdir}/usr/lib/systemd/system/sentry-relay.service"
  install -dm0755 "${pkgdir}/etc/sentry-relay"
}
