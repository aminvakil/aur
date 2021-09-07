#!/bin/sh
pacman -Syu git --noconfirm
git clone https://aur.archlinux.org/go-lint-git.git
chown -R devel: go-lint-git
su devel sh -c "cd go-lint-git && makepkg -sri --noconfirm"
