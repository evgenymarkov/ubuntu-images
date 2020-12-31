#!/usr/bin/env sh
set -e

pip install poetry
poetry completions bash > /etc/bash_completion.d/poetry.bash-completion
