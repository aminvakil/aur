#!/bin/sh
set -eux
pacman -Suy gnupg curl --noconfirm
su devel sh -c "curl https://fedoraproject.org/fedora.gpg | gpg --import"
