#!/bin/sh
set -eux
pacman -Suy tor --noconfirm
systemctl start tor
