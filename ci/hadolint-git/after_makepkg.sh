#!/bin/sh
set -euxo pipefail
hadolint --version
curl -OL https://raw.githubusercontent.com/aminvakil/docker-squid/master/Dockerfile
hadolint Dockerfile
