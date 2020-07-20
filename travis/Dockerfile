FROM archlinux:latest

ENV container docker

LABEL maintainer="Amin Vakil <info@aminvakil.com>"

ENV LANG=en_US.UTF-8

RUN pacman -Suy --noconfirm base-devel

ENTRYPOINT ["/usr/lib/systemd/systemd"]
