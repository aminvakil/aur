# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor:  koonix <me at koonix dot org>
# Contributor: chn <g897331845@gmail.com>
# Contributor: AkinoKaede <autmaple@protonmail.com>
# Contributor: DuckSoft <realducksoft@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: pandada8 <pandada8@gmail.com>

_name=xray
pkgname=${_name}-bin
pkgver=25.6.8
pkgrel=1
pkgdesc='The best v2ray-core, with XTLS support'
url='https://github.com/XTLS/Xray-core'
license=('MPL2')
optdepends=('xray-assets-symlinks')
options=('!strip') # don't modify prebuilt binaries
provides=("${_name}")
conflicts=("${_name}")

# source array template
# @ARCH@ and @SRCARCH@ will be substituted per the _archmap array below
_source=(
	"${_name}-v${pkgver}-@ARCH@.zip::${url}/releases/download/v${pkgver}/Xray-linux-@SRCARCH@.zip"
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

sha256sums_aarch64=('ca404752f27176cdaaddf929ec65a96cf18cceba403d6d97a66cdac48ef84dfe'
                    'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                    '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                    'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_i686=('0ae04584c4eae26d8dc7c515451fcbdafb768b535786fa09a2c1c7db8754c4d0'
                 'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                 '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                 'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_mips64el=('3d778e2d8a648c026ba5cbc2b8e461e385dcf8e3c41ed3c1b31a0dd9f1eeadbc'
                     'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                     '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                     'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_ppc64le=('fce055d82b461a76584f6693a8f3ceec9e576b5d616a666c68c1fed77e4b83a5'
                    'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                    '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                    'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_riscv64=('427afbe91cb8905ed21009b4e2744596d2857139fe92454207885ab7c02a5df7'
                    'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                    '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                    'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_ppc64=('525e61f49d283b4c1262b6560ba50f2ae30a470a44491366c56d9ddd24d437cf'
                  'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                  '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                  'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_mipsel=('fd49d30abac6969fd615a41934f0e7aa4264f5625850ef1393dbce2b48fd226f'
                   'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                   '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                   'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_mips64=('209ec3f97985b1a4048dc7eb9e72b3d0904365734347404752b4ce40ff206e37'
                   'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                   '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                   'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_arm=('996599a2c8eb4b9774441f144dae79d63265d6dc985b3c659e8265ad7497fa77'
                'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_x86_64=('51bcd3304fdbd64b58048b056da005fbaa6c83577fc351cae34024760e111e4b'
                   'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                   '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                   'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_armv7h=('996599a2c8eb4b9774441f144dae79d63265d6dc985b3c659e8265ad7497fa77'
                   'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                   '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                   'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_s390x=('07c6b8e0cbdea8140755d6a5dd5674f71d47645af2524898afe0529cca1ff543'
                  'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                  '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                  'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_mips=('203f78e383249541bbf4e436181095cc147f4073ce4c515c28f77214a579b052'
                 'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                 '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                 'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
