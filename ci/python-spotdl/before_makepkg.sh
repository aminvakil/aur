#!/bin/bash
pacman -Syu git --noconfirm
for i in {python-spotipy,python-pytube,python-rapidfuzz,python-ytmusicapi}; do
        git clone "https://aur.archlinux.org/$i.git"
        chown -R devel: "$i"
        su devel sh -c "cd $i && makepkg -sri --noconfirm"
done;
