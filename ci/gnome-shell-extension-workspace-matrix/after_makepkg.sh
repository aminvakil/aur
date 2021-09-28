#!/bin/sh
sudo pacman -S x11vnc --noconfirm
x11vnc -display :0
gnome-extensions enable wsmatrix@martin.zurowietz.de
