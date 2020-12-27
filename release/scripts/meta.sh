#!/usr/bin/env sh
set -e

get_image_meta() {
  image="${1}"
  docker image inspect "${image}" | jq '.[0]'
}

get_image_hash() {
  image_info="${1}"
  echo "${image_info}" | jq -r '.RepoDigests[0]' | cut -d ':' -f 2
}

get_image_size() {
  image_info="${1}"

  image_size_b=$(echo "${image_info}" | jq -r '.Size')
  images_size_mb=$((image_size_b / 1024 / 1024))

  echo ${images_size_mb}
}

get_image_user() {
  image_info="${1}"
  echo "${image_info}" | jq -r '.Config.User'
}

get_image_command() {
  image_info="${1}"
  echo "${image_info}" | jq -r '.Config.Cmd | join(" ")'
}

get_image_working_dir() {
  image_info="${1}"
  echo "${image_info}" | jq -r '.Config.WorkingDir'
}

get_image_environment() {
  image_info="${1}"
  echo "${image_info}" | jq -r '.Config.Env | join("\n")'
}
