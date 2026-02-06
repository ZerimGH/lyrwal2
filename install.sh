#!/usr/bin/env bash

set -xe

git submodule update --init --recursive
make all -C textwal2

python -m venv venv

venv/bin/pip install --upgrade pip
venv/bin/pip install -r py/requirements.txt

sudo mkdir -p /usr/lib/lyrwal2

sudo install -Dm755 lyrwal2.sh /usr/bin/lyrwal2
sudo install -Dm755 textwal2/build/textwal2 /usr/bin/textwal2
sudo install -d /usr/lib/lyrwal2
sudo cp -r py /usr/lib/lyrwal2/

sudo cp -r conf /etc/lyrwal2conf
