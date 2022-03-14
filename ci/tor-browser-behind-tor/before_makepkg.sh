#!/bin/sh
set -eux
pacman -Suy gnupg tor --noconfirm
systemctl start tor
su devel sh -c "gpg --auto-key-locate nodefault,wkd --locate-keys torbrowser@torproject.org"
