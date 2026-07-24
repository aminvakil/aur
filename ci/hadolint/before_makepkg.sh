#!/bin/sh
set -eux
pacman -Syu git --noconfirm
git clone --branch stack-bin --single-branch https://github.com/archlinux/aur/ stack-bin
chown -R devel: stack-bin
sudo -u devel sh -c "cd stack-bin && makepkg -sri --noconfirm"
