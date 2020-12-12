#!/usr/bin/env sh
set -e
export DEBIAN_FRONTEND=noninteractive

apt-get install --yes python3-pip
ln -s /usr/bin/pip3 /usr/bin/pip
