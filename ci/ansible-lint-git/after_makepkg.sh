#!/bin/sh
set -eux
ansible-lint --version
PROJECT_NAME="ansible-role-docker-installation"
REPO="https://github.com/aminvakil/${PROJECT_NAME}"
sudo pacman -Syu git --noconfirm
git clone "${REPO}"
cd "${PROJECT_NAME}"
ansible-lint .
cd ..
rm -rf "${PROJECT_NAME}"
