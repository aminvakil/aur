#!/bin/bash
set -eux
ansible-lint --version
# sudo pacman -Syu git --noconfirm
# for PROJECT_NAME in {"ansible-role-docker-installation","ansible-role-node-exporter"}; do
#         REPO="https://github.com/aminvakil/${PROJECT_NAME}"
#         git clone "${REPO}"
#         cd "${PROJECT_NAME}"
#         ansible-lint .
#         cd ..
#         rm -rf "${PROJECT_NAME}"
# done
