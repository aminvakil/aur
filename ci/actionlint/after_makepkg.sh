#!/bin/bash
set -Eeuox pipefail
ACTIONLINT_VERSION=$(actionlint --version | head -n 1)
PKGVER=$(grep -E "^pkgver=" /pkg/PKGBUILD | cut -d "=" -f 2)
if [ "${ACTIONLINT_VERSION}" -ne "${PKGVER}" ]; then
	echo "${ACTIONLINT_VERSION}"
	echo "${PKGVER}"
        exit 1
fi
