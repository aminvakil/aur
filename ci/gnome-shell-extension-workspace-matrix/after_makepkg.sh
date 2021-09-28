#!/bin/sh
sudo pacman -S xorg-server-xvfb --noconfirm
Xvfb %I -screen 0 1600x900x24 -fbdir /opt
gnome-extensions enable wsmatrix@martin.zurowietz.de
