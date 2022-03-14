#!/bin/sh
set -eux
pacman -Syu curl --noconfirm
su devel sh -c "cd /pkg && sudo sh zoipdl.sh"
