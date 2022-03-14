#!/bin/sh
set -euxo pipefail
pacman -Suy tor --noconfirm
systemctl start tor
