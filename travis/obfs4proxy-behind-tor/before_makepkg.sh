#!/bin/sh
pacman -Suy tor --noconfirm
systemctl start tor
