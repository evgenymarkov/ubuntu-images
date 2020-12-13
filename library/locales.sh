#!/usr/bin/env sh
set -e
export DEBIAN_FRONTEND=noninteractive

apt-get install --yes locales

sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
sed -i -e 's/# ru_RU.UTF-8 UTF-8/ru_RU.UTF-8 UTF-8/' /etc/locale.gen

dpkg-reconfigure locales
