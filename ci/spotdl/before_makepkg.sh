#!/bin/bash
set -eux
pacman -Syu git --noconfirm
for i in {python-spotipy,python-pox,python-klepto,python-syncedlyrics,python-bandcamp-api-git,python-demjson3,python-dacite,python-soundcloud-v2,python-datastar-py}; do
        git clone --branch "${i}" --single-branch https://github.com/archlinux/aur/ "${i}"
        chown -R devel: "$i"
        sudo -u devel sh -c "cd $i && makepkg -sri --nocheck --noconfirm"
done;
