#!/bin/sh
set -eux
pacman -Suy gnupg curl --noconfirm
su devel sh -c "curl --http1.1 https://getfedora.org/static/fedora.gpg | gpg --import"
