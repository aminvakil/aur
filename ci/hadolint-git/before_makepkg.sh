#!/bin/sh
sed -i "/\[testing\]/,/Include/"'s/^#//' /etc/pacman.conf
sed -i "/\[community-testing\]/,/Include/"'s/^#//' /etc/pacman.conf
pacman -Syu --noconfirm
