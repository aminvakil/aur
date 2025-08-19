#!/bin/sh
set -eux
pacman -Suy git --noconfirm
git clone --branch jmeter --single-branch https://github.com/archlinux/aur/ jmeter
chown -R devel: jmeter
su devel sh -c "cd jmeter && makepkg -sri --noconfirm"
