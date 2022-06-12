#!/bin/bash
set -eux
pacman -Syu git --noconfirm
for i in {cpp-taskflow,jarowinkler-cpp,python-rapidfuzz-capi,python-jarowinkler,python-spotipy,python-pytube,rapidfuzz-cpp,python-rapidfuzz,python-ytmusicapi}; do
        git clone "https://aur.archlinux.org/$i.git"
        chown -R devel: "$i"
        su devel sh -c "cd $i && makepkg -sri --noconfirm"
done;
