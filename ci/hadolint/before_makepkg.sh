#!/bin/sh
set -eux
pacman -Syu git --noconfirm
git clone --branch stack --single-branch https://github.com/archlinux/aur/ stack
chown -R devel: stack
sudo -u devel sh -c "cd stack && makepkg -sri --noconfirm"
