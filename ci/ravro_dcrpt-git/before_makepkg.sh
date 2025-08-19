#!/bin/bash
set -eux
pacman -Syu git --noconfirm
git clone --branch wkhtmltopdf-static --single-branch https://github.com/archlinux/aur/ wkhtmltopdf-static
chown -R devel: "wkhtmltopdf-static"
su devel sh -c "cd wkhtmltopdf-static && makepkg -sri --noconfirm"
