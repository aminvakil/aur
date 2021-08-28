#!/bin/sh
pacman -Syu curl --noconfirm
su devel sh -c "cd /pkg && sh zoipdl.sh"
