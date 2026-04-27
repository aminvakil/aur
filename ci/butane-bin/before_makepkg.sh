#!/bin/sh
set -eux
pacman -Syu gnupg curl --noconfirm
sudo -u devel sh -c "curl https://fedoraproject.org/fedora.gpg | gpg --import"
