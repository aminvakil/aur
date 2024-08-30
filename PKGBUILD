# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor:  koonix <me at koonix dot org>
# Contributor: chn <g897331845@gmail.com>
# Contributor: AkinoKaede <autmaple@protonmail.com>
# Contributor: DuckSoft <realducksoft@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: pandada8 <pandada8@gmail.com>

_name=xray
pkgname=${_name}-bin
pkgver=1.8.24
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

sha256sums_aarch64=('82939febc98c2738dd78e931a69967f9c16b771bd20f313bfc0629bacd13bab6'
                    'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                    '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                    'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_i686=('c287850e127b4e83906eed99ad8d9dfedc1228f54a7a59b166fcd9433deb61d9'
                 'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                 '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                 'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_mips64el=('fdacfdb5527690d5df5e0d62a85a926bd2d50d77a7e0dc15dbd172ee8b15fc86'
                     'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                     '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                     'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_ppc64le=('d250490bdbc1f4870a19ef314d849222c5c4e07fe43761a5d8cc05fa66af4508'
                    'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                    '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                    'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_riscv64=('763d33c708d2b2e0a6109ca224cd315c60920c37f574ef9b31d6b3c0bc40b79d'
                    'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                    '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                    'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_ppc64=('34e800f846c5b5dd29975be48078e61543e3ef12e2c0c770544f3016e91a60e8'
                  'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                  '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                  'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_mipsel=('728511bcdf66be92422267aa412fa56cf243c5105a96e8d7a9938f73cb1399ef'
                   'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                   '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                   'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_mips64=('f10bff26546fb32df3e24d2c26033ae0baec3ab55cafcc40d8ac59ed50112357'
                   'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                   '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                   'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_arm=('ba44ec0c38eee0690c96610a50c82728c4e528d4fb8ec42b0e28f783bd6ac3e3'
                'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_x86_64=('47a860787e823474a358d6bca536547df6dd08b69c6de482ea92a9e7e8f8969c'
                   'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                   '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                   'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_armv7h=('ba44ec0c38eee0690c96610a50c82728c4e528d4fb8ec42b0e28f783bd6ac3e3'
                   'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                   '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                   'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_s390x=('823f4285326b7ac4398681168b81009186d69fd59bc4906418b0e82cba105587'
                  'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                  '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                  'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
sha256sums_mips=('d760cc68abb9f21feebd78210b9c03a91c2bf0cf9ef83a2c8d66c166011b6b0b'
                 'd7fed595af92cb516d995593e46e8d47f0eb94fc06304cd5d5c62075ace22d4b'
                 '7c51184d52d387509747abb8cd8f1c916c413a3562887a96de0e937c411d7ee8'
                 'b9a50932d2b14b6d494d5bba39ea1c15f15771f3514c425397e1be5f14617955')
