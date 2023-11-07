#!/bin/sh
set -eux
pacman -Suy git --noconfirm
git clone https://aur.archlinux.org/python-jsonxs.git
chown -R devel: python-jsonxs
su devel sh -c "cd python-jsonxs && makepkg -sri --noconfirm"
