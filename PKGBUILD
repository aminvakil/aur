# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=slipstream
pkgver=0.1.1
pkgrel=1
pkgdesc="High-performance multi-path covert channel over DNS in Rust with vibe coding"
url="https://github.com/Mygod/slipstream-rust"
license=("Apache-2.0")
makedepends=("git" "cargo" "cmake")
depends=()
arch=("x86_64")
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('3c94d8ef8ce74342846c078ef6560fa9ef4b94dff393590aed545350ce2e7b76')
options=(!lto)

build() {
    cd "${srcdir}/${pkgname}-rust"
    git submodule update --init --recursive
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # # Remove LTO flags that break linking with picoquic C libraries
    # export CFLAGS="${CFLAGS/-flto=auto/}"
    # export CXXFLAGS="${CXXFLAGS/-flto=auto/}"
    cargo fetch --locked --target "$(rustc --print host-tuple)"
    cargo build --frozen --release -p slipstream-client -p slipstream-server
}

check() {
    cd "${srcdir}/${pkgname}-rust"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release -p slipstream-client -p slipstream-server
}

package() {
    cd "${srcdir}/${pkgname}-rust"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname}-client"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname}-server"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
