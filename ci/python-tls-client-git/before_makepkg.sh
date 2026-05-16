#!/bin/bash
set -eux
pacman -Syu git --noconfirm
i="tls-client-git"
git clone --branch "${i}" --single-branch https://github.com/archlinux/aur/ "${i}"
chown -R devel: "$i"
sudo -u devel sh -c "cd $i && makepkg -sri --nocheck --noconfirm"
