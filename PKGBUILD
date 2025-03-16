# Maintainer: Amin Vakil <info AT aminvakil DOT com>

_pkgname=pumba
pkgname=pumba-bin
pkgver=0.11.1
pkgrel=1
pkgdesc="Chaos testing, network emulation and stress testing tool for containers "
arch=('aarch64' 'x86_64')
url="https://github.com/alexei-led/pumba"
license=('Apache')
conflicts=('pumba')
provides=('pumba')

source_x86_64=("${_pkgname}-linux-x86_64::$url/releases/download/$pkgver/${_pkgname}_linux_amd64")
source_aarch64=("${_pkgname}-linux-aarch64::$url/releases/download/$pkgver/${_pkgname}_linux_arm64")

sha256sums_aarch64=('9eebb2ce7ebb08e40b71f7585c71cabfcc6add0bf3bcc638b95ab90f867cf69d')
sha256sums_x86_64=('d7cfc2e91fbec03bd6e46e2d45be6a5d643763066658cdc9c3d0a10b7a146919')

package() {
    mkdir -p ${pkgdir}/usr/bin
    install ${srcdir}/${_pkgname}-linux-${CARCH} ${pkgdir}/usr/bin/${_pkgname}
}

