#!/usr/bin/env sh
set -e
export DEBIAN_FRONTEND=noninteractive

{
  echo ''
  echo 'EDITOR=nano'
} >> /root/.bashrc

{
  echo ''
  echo 'set tabsize 4'
  echo 'include "/usr/share/nano/*.nanorc"'
} >> /root/.nanorc

{
  echo ''
  echo 'EDITOR=nano'
} >> /home/ubuntu/.bashrc

{
  echo ''
  echo 'set tabsize 4'
  echo 'include "/usr/share/nano/*.nanorc"'
} >> /home/ubuntu/.nanorc

apt-get install --yes nano
