#!/bin/sh
set -Eeuxo pipefail
pacman -Suy tor --noconfirm
systemctl start tor
