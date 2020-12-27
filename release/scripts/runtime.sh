#!/usr/bin/env sh
set -e

test_container="$(pwgen -1 -c 16)"

start_container() {
  test_image="${1}"
  docker run --rm --detach --name "${test_container}" "${test_image}" tail -f /dev/null > /dev/null
}

stop_container() {
  docker stop --time 1 "${test_container}" > /dev/null
}

_run_in_container() {
  docker exec "${test_container}" bash -c "${1}"
}

get_runtime_user() {
  _run_in_container 'whoami'
}

get_runtime_timezone() {
  _run_in_container 'cat /etc/timezone'
}

get_runtime_working_dir() {
  _run_in_container 'pwd'
}

get_runtime_locale_settings() {
  _run_in_container 'locale'
}

get_runtime_supported_locales() {
  _run_in_container 'localedef --list-archive'
}

get_runtime_installed_os_packages() {
  format='${Package} ${Version}\n'
  _run_in_container "dpkg-query -f '${format}' -W"
}

get_runtime_installed_node_packages() {
  if [ -n "$(_run_in_container 'which npm')" ]
  then
    npm_output='.dependencies | to_entries[] | .key + " " + .value.version'
    _run_in_container 'npm list --global --json --depth=0' | jq -r "${npm_output}"
  else
    echo 'No packages installed'
  fi
}

get_runtime_installed_python_packages() {
  if [ -n "$(_run_in_container 'which pip')" ]
  then
    _run_in_container "pip list --format freeze | sed 's/==/ /g'"
  else
    echo 'No packages installed'
  fi
}
