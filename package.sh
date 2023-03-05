#!/bin/sh

mkdir -p ./pkg/tmux
mkdir -p ./pkg/nvim/config
mkdir -p ./pkg/nvim/local
mkdir -p ./pkg/go
mkdir -p ./pkg/dependency
mkdir -p ./pkg/wezterm

cp ./deploy-common.sh ./pkg/
cp ~/.tmux.conf ./pkg/
cp -r ~/.tmux/ ./pkg/
cp -r ~/.config/nvim/ ./pkg/nvim/config
cp -r ~/.local/share/nvim/ ./pkg/nvim/local
cp ~/.config/starship.toml ./pkg/
cp ~/.config/wezterm/wezterm.lua ./pkg/wezterm/
cp -r ./dependency/ ./pkg/dependency
cp -r 
