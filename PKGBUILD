# Maintainer: Amin Vakil <info AT aminvakil DOT com>

_pkgname=pumba
pkgname=pumba-bin
pkgver=0.11.6
pkgrel=1
pkgdesc="Chaos testing, network emulation and stress testing tool for containers "
arch=('aarch64' 'x86_64')
url="https://github.com/alexei-led/pumba"
license=('Apache')
conflicts=('pumba')
provides=('pumba')

source_x86_64=("${_pkgname}-linux-x86_64::$url/releases/download/$pkgver/${_pkgname}_linux_amd64")
source_aarch64=("${_pkgname}-linux-aarch64::$url/releases/download/$pkgver/${_pkgname}_linux_arm64")

sha256sums_aarch64=('e4e47552fd4fda6301299e57e31fc12a5a69043e1288f7ad2331f4b7bf179b40')
sha256sums_x86_64=('93f5f7b11c248d3697a5a35f85af639988b06eb1576aeb6731b68c8d9868b8f3')

package() {
    mkdir -p ${pkgdir}/usr/bin
    install ${srcdir}/${_pkgname}-linux-${CARCH} ${pkgdir}/usr/bin/${_pkgname}
}

