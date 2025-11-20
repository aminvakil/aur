#!/bin/sh
set -eux
pacman -Suy git --noconfirm
git clone --branch gtk2 --single-branch https://github.com/archlinux/aur/ gtk2
chown -R devel: gtk2
su devel sh -c "cd gtk2 && makepkg -sri --noconfirm"
