#!/bin/sh
set -eux
pacman -Suy gnupg curl --noconfirm
sudo -u devel sh -c "curl https://getfedora.org/static/fedora.gpg | gpg --import"
