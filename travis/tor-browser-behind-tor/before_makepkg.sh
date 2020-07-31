#/bin/sh
sudo pacman -Suy gnupg tor --noconfirm
sudo systemctl start tor
gpg --auto-key-locate nodefault,wkd --locate-keys torbrowser@torproject.org
