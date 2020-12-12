#!/usr/bin/env sh
set -e
export DEBIAN_FRONTEND=noninteractive

curl -sL https://deb.nodesource.com/setup_14.x | bash -
apt-get install --yes nodejs
