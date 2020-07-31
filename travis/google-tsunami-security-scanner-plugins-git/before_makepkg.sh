#!/bin/sh
pacman -Suy java-runtime-common --noconfirm
su devel sh -c "echo 'source /etc/profile.d/jre.sh' >> ~/.bashrc"
