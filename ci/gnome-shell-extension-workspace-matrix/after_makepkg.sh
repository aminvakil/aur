#!/bin/sh
sudo pacman -S xorg-server-xvfb --noconfirm
xvfb-run gnome-shell --x11
gnome-extensions enable wsmatrix@martin.zurowietz.de
