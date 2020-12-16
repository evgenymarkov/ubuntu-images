#!/usr/bin/env sh
set -e

{
  echo ''
  echo 'PS1="\W # "'
  echo 'TERM="xterm-256color"'
} >> /root/.bashrc

{
  echo ''
  echo 'PS1="\W $ "'
  echo 'TERM="xterm-256color"'
} >> /home/ubuntu/.bashrc
