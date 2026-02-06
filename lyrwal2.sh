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

