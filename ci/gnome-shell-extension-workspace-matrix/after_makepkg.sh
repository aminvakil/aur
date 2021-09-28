#!/bin/sh
sudo pacman -S x11vnc --noconfirm
x11vnc -create -many -display :0
gnome-extensions enable wsmatrix@martin.zurowietz.de
