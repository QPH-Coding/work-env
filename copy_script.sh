#!/bin/sh

cp -r ~/.config/nvim/* ./nvim/
cp ~/.config/wezterm/wezterm.lua ./wezterm/
cp ~/.config/starship.toml ./starship/
cp -r ~/.tmux/* ./tmux/.tmux/
cp ~/.tmux.conf ./tmux/

rm -rf ./tmux/.tmux/plugins/tpm/.git/
rm -rf ./tmux/.tmux/plugins/tmux-cpu/.git/
rm -rf ./tmux/.tmux/plugins/tmux-battery/.git/
rm -rf ./tmux/.tmux/plugins/tmux-net-speed/.git/

rm -rf ./dependency/npm-dependency/language-tools/.git/

