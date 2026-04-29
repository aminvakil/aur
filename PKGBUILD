# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=python-datastar-py
_name=${pkgname#python-}
pkgver=1.0.0
pkgrel=1
pkgdesc="Helper functions and classes for the Datastar library"
arch=('any')
url="https://github.com/starfederation/datastar-python"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-hatchling' 'python-installer')
optdepends=(
  'python-django: Django integration'
  'python-fastapi: FastAPI integration'
  'python-quart: Quart integration'
  'python-sanic: Sanic integration'
  'python-starlette: Starlette integration'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-${pkgver}.tar.gz")
sha512sums=('683cc4aaf5b5fd7a5d93713e9047c4206ffeaa7bb29d114cb59c964c0cb973a365d5d2442945324f31e2d96a5592ab96e4a36f7c0512ec099fd08060f53dd688')

build() {
  cd "${_name//-/_}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name//-/_}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
