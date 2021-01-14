#!/usr/bin/env sh
set -e
script=$(dirname "$(realpath "${0}")")
project=$(dirname "${script}")

. "${script}/scripts/meta.sh"
. "${script}/scripts/runtime.sh"
. "${script}/scripts/version.sh"

create_description() {
  title="${1}"
  image="${2}"
  template="${3}"
  image_meta="$(get_image_meta "${image}")"

  start_container "${image}"

  description=$(
    title="${title}" \
    image="${image}" \
    meta_size="$(get_image_size "${image_meta}")" \
    meta_hash="$(get_image_hash "${image_meta}")" \
    meta_user="$(get_image_user "${image_meta}")" \
    meta_command="$(get_image_command "${image_meta}")" \
    meta_working_dir="$(get_image_working_dir "${image_meta}")" \
    meta_environment="$(get_image_environment "${image_meta}")" \
    runtime_user="$(get_runtime_user)" \
    runtime_timezone="$(get_runtime_timezone)" \
    runtime_working_dir="$(get_runtime_working_dir)" \
    runtime_locale_settings="$(get_runtime_locale_settings)" \
    runtime_supported_locales="$(get_runtime_supported_locales)" \
    runtime_installed_os_packages="$(get_runtime_installed_os_packages)" \
    runtime_installed_node_packages="$(get_runtime_installed_node_packages)" \
    runtime_installed_python_packages="$(get_runtime_installed_python_packages)" \
    envsubst < "${template}"
  )

  stop_container

  echo "${description}"
}

release() {
  title="${1}"
  version="${2}"
  base_tag="${3}"

  docker pull "${base_tag}" > /dev/null 2>&1

  release_tag="${base_tag}-${version}"
  docker tag "${base_tag}" "${release_tag}"

  description=$(
    create_description \
      "${title}" \
      "${release_tag}" \
      "${script}/template.md"
  )

  docker push "${release_tag}" > /dev/null 2>&1

  echo "${description}"
}

version="$(get_version)"
mkdir -p "${project}/build"

{
  release \
    "Ubuntu" "${version}" \
    'ghcr.io/evgenymarkov/ubuntu:20.04'

  printf '\n<br>\n\n'

  release \
    "Ubuntu Dev" "${version}" \
    'ghcr.io/evgenymarkov/ubuntu-dev:20.04'

  printf '\n<br>\n\n'

  release \
    "Python" "${version}" \
    'ghcr.io/evgenymarkov/python:3.8'

  printf '\n<br>\n\n'

  release \
    "Node" "${version}" \
    'ghcr.io/evgenymarkov/node:14'
} > "${project}/build/release.md"
