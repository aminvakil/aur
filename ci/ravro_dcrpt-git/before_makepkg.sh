#!/bin/sh
set -eux
pacman -Syu git --noconfirm
for i in {qt5-webkit,wkhtmltopdf}; do
        git clone "https://aur.archlinux.org/$i.git"
        chown -R devel: "$i"
        su devel sh -c "cd $i && makepkg -sri --noconfirm"
done;
