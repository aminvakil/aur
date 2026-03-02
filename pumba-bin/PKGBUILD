# Maintainer: Amin Vakil <info AT aminvakil DOT com>

_pkgname=pumba
pkgname=pumba-bin
pkgver=1.0.4
pkgrel=1
pkgdesc="Chaos testing, network emulation and stress testing tool for containers "
arch=('aarch64' 'x86_64')
url="https://github.com/alexei-led/pumba"
license=('Apache-2.0')
conflicts=('pumba')
provides=('pumba')

source_x86_64=("${_pkgname}-linux-x86_64::$url/releases/download/$pkgver/${_pkgname}_linux_amd64")
source_aarch64=("${_pkgname}-linux-aarch64::$url/releases/download/$pkgver/${_pkgname}_linux_arm64")

sha256sums_aarch64=('222924c9bfdfcc0a213277d2deb57cf4a4e7bc851c488cee02b68b88c512ee3d')
sha256sums_x86_64=('1dd0fe0f413b9be48ddeffe87d1cbb9d6bc55a06b7ee6cff5e2885e93dcf0920')

package() {
    mkdir -p ${pkgdir}/usr/bin
    install ${srcdir}/${_pkgname}-linux-${CARCH} ${pkgdir}/usr/bin/${_pkgname}
}

