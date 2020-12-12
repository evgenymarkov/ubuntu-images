#!/usr/bin/env sh
set -e
export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get full-upgrade --yes
