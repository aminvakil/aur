# Maintainer: Amin Vakil <info AT aminvakil DOT com>

_pkgname=slipstream
pkgname=slipstream-git
pkgver=r63.af38c2b
pkgrel=1
pkgdesc="High-performance multi-path covert channel over DNS in Rust with vibe coding"
url="https://github.com/Mygod/slipstream-rust"
license=("Apache-2.0")
makedepends=("git" "cargo" "cmake")
depends=()
arch=("x86_64")
source=("${_pkgname}-rust::git+${url}.git")
sha256sums=("SKIP")
provides=("slipstream")
conflicts=("slipstream")
options=(!lto)

pkgver() {
    cd "${srcdir}/${_pkgname}-rust"

    # Get the version number.
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${_pkgname}-rust"
    git submodule update --init --recursive
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
    cd "${srcdir}/${_pkgname}-rust"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # # Remove LTO flags that break linking with picoquic C libraries
    # export CFLAGS="${CFLAGS/-flto=auto/}"
    # export CXXFLAGS="${CXXFLAGS/-flto=auto/}"
    cargo build --frozen --release -p slipstream-client
    cargo build --frozen --release -p slipstream-server
}

check() {
    cd "${srcdir}/${_pkgname}-rust"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release -p slipstream-client -p slipstream-server || true
}

package() {
    cd "${srcdir}/${_pkgname}-rust"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${_pkgname}-client"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${_pkgname}-server"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
