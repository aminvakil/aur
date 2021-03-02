#!/bin/sh
pacman -Suy git --noconfirm
git clone https://aur.archlinux.org/libgmp-static.git
chown -R devel: libgmp-static
su devel sh -c "cd libgmp-static && makepkg -sri --noconfirm"
