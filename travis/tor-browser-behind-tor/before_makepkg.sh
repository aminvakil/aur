#/bin/sh
sudo pacman -Suy gnupg tor
sudo systemctl start tor
gpg --auto-key-locate nodefault,wkd --locate-keys torbrowser@torproject.org
