#!/usr/bin/env sh
set -e
export DEBIAN_FRONTEND=noninteractive

apt-get install --yes python3-minimal
ln -s /usr/bin/python3 /usr/bin/python
