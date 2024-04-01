#!/bin/bash
set -eux
pacman -Syu git --noconfirm
for i in {python-spotipy,python-pytube,python-pox,python-klepto,python-jaconv,python-pykakasi,python-syncedlyrics,python-bandcamp-api-git,python-demjson3,python-dacite,python-soundcloud-v2}; do
        git clone "https://aur.archlinux.org/$i.git"
        chown -R devel: "$i"
        su devel sh -c "cd $i && makepkg -sri --nocheck --noconfirm"
done;
