#!/bin/bash
set -eux
pacman -Syu git --noconfirm
git clone "https://aur.archlinux.org/wkhtmltopdf-static.git"
chown -R devel: "wkhtmltopdf-static"
su devel sh -c "cd wkhtmltopdf-static && makepkg -sri --noconfirm"
