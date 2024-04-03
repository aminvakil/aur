# Maintainer:  koonix <me at koonix dot org>
# Contributor: chn <g897331845@gmail.com>
# Contributor: AkinoKaede <autmaple@protonmail.com>
# Contributor: DuckSoft <realducksoft@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: pandada8 <pandada8@gmail.com>

_name=xray
pkgname=${_name}-bin

pkgrel=1
_version=v1.8.10
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
	'63c559fe402c405a3dec3db6c85dbc01ec08e5c088ae3ed62cd4bff122b930e4'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_i686=(
	'7cc749ab4b40b19af90d4fbb999025144b3b556c4201ac32e2c0112d6887b6a3'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_mips64el=(
	'3a638d0388d2b5c96932aa5c4da847d118757076d15790ae9a4c21e560d07077'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_ppc64le=(
	'32392486827959379cbb7b97b348aa877a27cccbd3098dbfc0afe4862a1ae88c'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_riscv64=(
	'db6632efb5d92bee7b9cd652e21a1a338da3335586657dd24051985f0374538b'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_ppc64=(
	'29c2d9d22884034002097651b6515ad07a82ee469a9c892fc003c37bf8eed103'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_mipsel=(
	'981760d0ffb118eb15b76b72c755d0e033e77b2ace978dd8a367f3feb9d007ae'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_mips64=(
	'6e34a33e4e031c70bea82361d3ed193772a386a350e2cdf3fb80960df0c5782f'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_arm=(
	'138214876e71a09e635f69ec9947f6ad75444ae379bd8e9243e000ac626a2591'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_x86_64=(
	'bfe015d33b9e3a698c47837fb0b08f0e84fdf442a8efe965ca2381c36f5eef48'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_armv7h=(
	'138214876e71a09e635f69ec9947f6ad75444ae379bd8e9243e000ac626a2591'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_s390x=(
	'f66702c2bae9883a3f1d3e6ff80b148191164fc9caa4b8ddb39517b80086e485'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
sha256sums_mips=(
	'753e15f189af2d1341b05da696aea41fdae5cad7c2229593b903ebacac92477e'
	'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
	'7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
	'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955'
)
