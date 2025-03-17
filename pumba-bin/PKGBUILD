# Maintainer: Amin Vakil <info AT aminvakil DOT com>

_pkgname=pumba
pkgname=pumba-bin
pkgver=0.11.5
pkgrel=1
pkgdesc="Chaos testing, network emulation and stress testing tool for containers "
arch=('aarch64' 'x86_64')
url="https://github.com/alexei-led/pumba"
license=('Apache')
conflicts=('pumba')
provides=('pumba')

source_x86_64=("${_pkgname}-linux-x86_64::$url/releases/download/$pkgver/${_pkgname}_linux_amd64")
source_aarch64=("${_pkgname}-linux-aarch64::$url/releases/download/$pkgver/${_pkgname}_linux_arm64")

sha256sums_aarch64=('13f8c60780672656471993633659ca66ae2f89ce3cd099005b1746081cadec1d')
sha256sums_x86_64=('f3aaebcf1e4199e93f3cbcbc8c029af8627cf75de9bd58f766acf4d23dcdd2c3')

package() {
    mkdir -p ${pkgdir}/usr/bin
    install ${srcdir}/${_pkgname}-linux-${CARCH} ${pkgdir}/usr/bin/${_pkgname}
}

