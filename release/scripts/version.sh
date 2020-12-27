#!/usr/bin/env sh
set -e

get_version() {
  if [ -n "${IMAGE_VERSION}" ]; then
    echo "${IMAGE_VERSION}"
  else
    git rev-parse --short HEAD
  fi
}
