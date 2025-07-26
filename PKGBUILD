# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor:  koonix <me at koonix dot org>
# Contributor: chn <g897331845@gmail.com>
# Contributor: AkinoKaede <autmaple@protonmail.com>
# Contributor: DuckSoft <realducksoft@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: pandada8 <pandada8@gmail.com>

_name=xray
pkgname=${_name}-bin
pkgver=25.7.26
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

sha256sums_aarch64=('d808e3da9a0551b927a05c20e20424238305ca9ae043ceeed99189c46604defd'
                    'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                    '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                    'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_i686=('699f70590aafc4d6629106e5ed105540dd76f79905b24100f421667e49a70378'
                 'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                 '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                 'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_mips64el=('78ebab9665883a7f46927886bf3fe026e803c1f056b15f9859434f37e9b74944'
                     'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                     '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                     'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_ppc64le=('ea5aa7f82794237d9424b275e17d6ab3325dd10012f1b03b267e2a234f443355'
                    'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                    '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                    'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_riscv64=('fb46f070e83b6b6e49b6b7ee6b9d1a20e6f63b88b4a2457f96d36866ec3358f1'
                    'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                    '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                    'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_ppc64=('25dacd5899d35f6da061991e1d12aa6de48cc52eb63a639a01d10e5b1c1f0cb2'
                  'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                  '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                  'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_mipsel=('15f538cfb5dfab3cfb5fee786afb44b6d95d1f217c8acaa479d3b29bf8decf09'
                   'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                   '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                   'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_mips64=('4da8162c103d0c40e75621c850e9b2156a93348d60940d9466ee49b0501170ad'
                   'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                   '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                   'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_arm=('e752c8a6f8059f89380b1e2e52f7823d2d9aedd92f8ebec2bbfba9fe41e7f985'
                'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_x86_64=('6e7116919560dc3dd744b44076b3c08d07326657614153f06a0a6e5a5cfce008'
                   'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                   '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                   'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_armv7h=('e752c8a6f8059f89380b1e2e52f7823d2d9aedd92f8ebec2bbfba9fe41e7f985'
                   'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                   '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                   'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_s390x=('4c593c6834e5b01dd27d659e20bf4e33d4b34e6745b60e336e50f41eab0cbe06'
                  'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                  '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                  'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_mips=('de16e06f06b81157cc5bd6b5d55c78e45c307c5395be6c08602cc5f1f11a374b'
                 'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                 '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                 'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
