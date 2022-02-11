#!/bin/sh
sed -i "/\[testing\]/,/Include/"'s/^#//' pacman.conf
sed -i "/\[community-testing\]/,/Include/"'s/^#//' pacman.conf
pacman -Syu --noconfirm
