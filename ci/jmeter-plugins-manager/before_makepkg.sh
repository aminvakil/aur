#!/bin/sh
set -euxo pipefail
pacman -Suy git --noconfirm
git clone https://aur.archlinux.org/jmeter.git
chown -R devel: jmeter
su devel sh -c "cd jmeter && makepkg -sri --noconfirm"
