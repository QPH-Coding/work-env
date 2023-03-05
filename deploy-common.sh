#!/bin/sh

cp -r ./tmux/* ~/
mkdir -p ~/.config/wezterm/
cp ./wezterm/wezterm.lua ~/.config/wezterm/
cp ./starship/starship.toml ~/.config/
cp -r ./nvim/ ~/.config/nvim/
