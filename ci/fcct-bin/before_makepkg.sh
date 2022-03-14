#!/bin/sh
set -euxo pipefail
pacman -Suy gnupg curl --noconfirm
su devel sh -c "curl https://getfedora.org/static/fedora.gpg | gpg --import"
