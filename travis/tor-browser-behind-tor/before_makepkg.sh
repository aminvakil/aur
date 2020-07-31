#/bin/sh
sudo pacman -Suy gnupg
gpg --auto-key-locate nodefault,wkd --locate-keys torbrowser@torproject.org
