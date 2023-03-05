#!/bin/sh

# tar -xf ./shellcheck-stable.linux.x86_64.tar.xz
# tar -xf ./node-v18.14.2-linux-x64.tar.xz
sudo apt-get install mercurial
sudo ./go-install.sh
sudo ./npm-dependency/install.sh
sudo pip install ./pip-dependency/*
sudo dpkg -i ./fd-musl_8.6.0_amd64.deb
sudo dpkg -i ./ripgrep_13.0.0_amd64.deb
sudo cp ./hadolint-Linux-x86_64 /usr/local/bin/hadolint
