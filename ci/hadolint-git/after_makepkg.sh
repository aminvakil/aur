#!/bin/sh
set -Eeuxo pipefail
hadolint --version
curl -OL https://raw.githubusercontent.com/aminvakil/docker-squid/master/Dockerfile
hadolint Dockerfile
