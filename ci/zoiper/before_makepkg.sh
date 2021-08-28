#!/bin/sh
pacman -Syu curl --noconfirm
su devel sh -c "cd /pkg && sudo sh zoipdl.sh"
