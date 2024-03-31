# Maintainer: zoorat <zoorat [at] protonmail [dot] com>
# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Tim Schumacher <timschumi@gmx.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=spotdl
pkgver=4.2.5
pkgrel=1

pkgdesc='Download your Spotify playlists and songs along with album art and metadata (from YouTube if a match is found).'
arch=('any')
url='https://github.com/spotDL/spotify-downloader'
# url='https://spotdl.readthedocs.io/en/latest/'
license=('MIT')

# https://github.com/spotDL/spotify-downloader/blob/master/pyproject.toml
depends=(
	'ffmpeg'
	'python'
	'python-bandcamp-api'
	'python-beautifulsoup4'
	'python-dacite'
	'python-demjson3'
	'python-fastapi'
	'python-mutagen'
	'python-platformdirs'
	'python-pydantic'
	'python-pykakasi'
	'python-pytube'
	'python-rapidfuzz'
	'python-requests'
	'python-rich'
	'python-soundcloud-v2'
	'python-slugify'
	'python-spotipy'
	'python-syncedlyrics'
	'python-typing-extensions'
	'python-ytmusicapi'
	'uvicorn'
	'yt-dlp'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
checkdepends=('python-pytest-asyncio' 'python-pytest-mock')
provides=("$pkgname" 'python-spotdl')
replaces=('python-spotdl')
conflicts=('python-spotdl')

# source=("https://github.com/spotDL/spotify-downloader/archive/refs/tags/v$pkgver.zip")
source=("https://files.pythonhosted.org/packages/source/s/$pkgname/$pkgname-$pkgver.tar.gz")
b2sums=('e7b1ba0c7bebceb0d78ea0b4974b7a2a46612f03a3b3e457f8f996d68b9b23df0c199448956ad5f4398effbe5d59d51c43c310f998a8d4798d07bb89f6c51a5d')

# Document: https://wiki.archlinux.org/title/Python_package_guidelines
build() {
	# cd spotify-downloader-$pkgver
	cd spotdl-$pkgver
	# https://github.com/python-poetry/poetry/issues/5547
	python -m build --wheel --no-isolation
}

check() {
	# cd spotify-downloader-$pkgver
	cd spotdl-$pkgver
	pytest || echo 'Tests failed! OR no tests.'
}

package() {
	# cd spotify-downloader-$pkgver
	cd spotdl-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -vDm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
