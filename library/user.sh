#!/usr/bin/env sh
set -e
export DEBIAN_FRONTEND=noninteractive

USER_UID=1000
USER_GID=1000
USERNAME=ubuntu

apt-get install --yes sudo

groupadd --gid ${USER_GID} ${USERNAME}
useradd -s /bin/bash --uid ${USER_UID} --gid ${USER_GID} -m ${USERNAME}

echo "${USERNAME} ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/${USERNAME}
chmod 0440 /etc/sudoers.d/${USERNAME}
