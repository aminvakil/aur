#!/bin/sh
set -eux
pacman -Syu git --noconfirm
git clone --branch golangci-lint --single-branch https://github.com/archlinux/aur/ golangci-lint
chown -R devel: golangci-lint
su devel sh -c "cd golangci-lint && makepkg -sri --noconfirm"
