#!/bin/sh
set -eux
pacman -Suy git --noconfirm
git clone --branch python-jsonxs --single-branch https://github.com/archlinux/aur/ python-jsonxs
chown -R devel: python-jsonxs
sudo -u devel sh -c "cd python-jsonxs && makepkg -sri --noconfirm"
