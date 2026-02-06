#!/usr/bin/env bash

cd "$(dirname "$0")"

set -e

cmd="$1"
arg="$2"

if [ -z "$cmd" ]; then
    echo "Usage: $0 {help|update}"
    exit 1
fi

python_loc="/usr/lib/lyrwal2/venv/bin/python"

if [ "$cmd" = "update" ]; then
  ex="no"
  if [ ! -e ~/.config/lyrwal2 ]; then
    cp -r /etc/lyrwal2conf/lyrwal2 ~/.config
    echo 'Copied default config to ~/.config/lyrwal2'
    ex="ye"
  fi
  if [ ! -e ~/.config/textwal2 ]; then
    cp -r /etc/lyrwal2conf/textwal2 ~/.config
    echo 'Copied default config to ~/.config/textwal2'
    ex="ye"
  fi
  if [ "$ex" = "$ye" ]; then
    exit
  fi

  cd /usr/lib/lyrwal2/py
  $python_loc ./main.py

elif [ "$cmd" = "help" ]; then
  cat <<EOL
  TODO: Help message
EOL
else
    echo "Unknown command: $cmd"
    echo "Usage: $0 {help|update}"
    exit 1
fi

