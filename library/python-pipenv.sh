#!/usr/bin/env sh
set -e

pip install pipenv
echo 'eval "$(pipenv --completion)"' >> /home/ubuntu/.bashrc
