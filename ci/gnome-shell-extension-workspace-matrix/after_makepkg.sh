#!/bin/sh
sudo pacman -S x11vnc --noconfirm
sudo x11vnc -create -many -display :0
sudo gnome-extensions enable wsmatrix@martin.zurowietz.de
