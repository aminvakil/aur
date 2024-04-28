# Maintainer:  koonix <me at koonix dot org>
# Contributor: chn <g897331845@gmail.com>
# Contributor: AkinoKaede <autmaple@protonmail.com>
# Contributor: DuckSoft <realducksoft@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: pandada8 <pandada8@gmail.com>

_name=xray
pkgname=${_name}-bin

pkgrel=1
_version=v1.8.11
pkgver=${_version//-/_}
pkgver=${pkgver#v}

pkgdesc='The best v2ray-core, with XTLS support'
url='https://github.com/XTLS/Xray-core'
license=('MPL2')

depends=('xray-assets-symlinks')
options=('!strip') # don't modify prebuilt binaries
provides=("${_name}")
conflicts=("${_name}")

# source array template
# @ARCH@ and @SRCARCH@ will be substituted per the _archmap array below
_source=(
	"${_name}-${_version}-@ARCH@.zip::${url}/releases/download/${_version}/Xray-linux-@SRCARCH@.zip"
	config.json
	xray.service.tmpl
	xray-sysusers.conf
)

# architectures and their counterparts used in the source URL
declare -Ag _archmap=(
#	[ARCH]=SRCARCH
	['i686']='32'
	['x86_64']='64'
	['arm']='arm32-v7a'
	['armv7h']='arm32-v7a'
	['aarch64']='arm64-v8a'
	['mips']='mips32'
	['mipsel']='mips32le'
	['mips64']='mips64'
	['mips64el']='mips64le'
	['ppc64']='ppc64'
	['ppc64le']='ppc64le'
	['riscv64']='riscv64'
	['s390x']='s390x'
)

# config file's path
_config="/etc/xray/config.json"
backup=("${_config#/}")

# generate systemd services from the template
prepare()
{
	# regular service
	TMPL_CONFIG_FILE_PATH="${_config}" \
		_envsubst xray.service.tmpl xray.service

	# multi-instance service (http://0pointer.net/blog/projects/instances.html)
	TMPL_CONFIG_FILE_PATH="${_config%/*}/%i.${_config##*.}" \
		_envsubst xray.service.tmpl xray@.service
}

package()
{
	install -Dm644 xray.service  -t "${pkgdir}/usr/lib/systemd/system/"
	install -Dm644 xray@.service -t "${pkgdir}/usr/lib/systemd/system/"
	install -Dm644 xray-sysusers.conf "${pkgdir}/usr/lib/sysusers.d/xray.conf"

	install -Dm644 config.json   "${pkgdir}${_config}"
	install -Dm755 xray          "${pkgdir}/usr/bin/xray"
	install -Dm644 README.md     "${pkgdir}/usr/share/doc/xray/USAGE.txt"
	install -Dm644 LICENSE       "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# boilerplate for generating the "arch=()" and "source_<arch>=()" arrays
arch=("${!_archmap[@]}")
for _a in "${!_archmap[@]}"; do
	_sa=${_archmap[$_a]}
	_s=("${_source[@]//@ARCH@/$_a}")
	_s=("${_s[@]//@SRCARCH@/$_sa}")
	declare -ag "source_${_a}="'("${_s[@]}")'
done

# wrapper function for envsubst
_envsubst()
{
	local in=$1 out=$2 vars=("${!TMPL_@}")
	envsubst "${vars[*]/#/'$'}" < "$in" > "$out"
	grep -q '\${\?TMPL_[A-Z_]\+' "$out" && {
		echo "error: template file has unsubstituted references: '$in'" >&2
		rm "$out"
		return 1
	} ||:
}

sha256sums_aarch64=(
	'0b2c101407b8e73a315d8107b73218f40eb9b933aead75026955d4586fb50c77'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_i686=(
	'6dbaefc3907705eb6182eb67f4fc3655907a9e8e3eb5c1f7d5c9ebb0866586b0'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_mips64el=(
	'eaf80d0c66bb8bb1cea0415e1e333ef8d08e45e3a4e40a1823df04fcc6ee1a8a'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_ppc64le=(
	'965e9a44c95d73467706ce769af7e7123e282efa0c0b97565b036ed33c3dcc7f'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_riscv64=(
	'46a126bad75e74cc63251e94f553cccb5c99d2b6e0122eb14fe5292ef282da04'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_ppc64=(
	'2474ad964e8b885cc76bbd38170184cfa40d2fa4437712bc96d2145313827357'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_mipsel=(
	'15cf81845df17ed621147b247547234cbcfc82619dc84a0d9be788139bbff63e'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_mips64=(
	'4ef5df06dafa8e80ff45f9f56bdc8b7de36b8c5675aef0764e7d3f237239d537'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_arm=(
	'f1d95af075b40532da43c37dcd6b09803a38408a0a47822bc703c9d9f8b8e038'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_x86_64=(
	'a25c9851cef0ddae4e08a27612792a81c4f816b6f2669ce7aae6eed83e7154ba'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_armv7h=(
	'f1d95af075b40532da43c37dcd6b09803a38408a0a47822bc703c9d9f8b8e038'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_s390x=(
	'85068d217fc15d014130cfd81203dde315e5f5c7af0ad6b82ef589244ceacf5f'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_mips=(
	'cd832b9e3740f14b2f023d85f1b691c81c7b8baafab40d2d0b9b2a02c92e140d'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
