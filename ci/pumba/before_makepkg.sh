#!/bin/sh
set -Eeuxo pipefail
pacman -Syu git --noconfirm
git clone https://aur.archlinux.org/golangci-lint.git
chown -R devel: golangci-lint
su devel sh -c "cd golangci-lint && makepkg -sri --noconfirm"
