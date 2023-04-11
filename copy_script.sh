#!/bin/sh

rm -r ./nvim/*
cp -r ~/.config/nvim/* ./nvim/
cp -r ~/.config/lvim/* ./lvim/
rm -r ./wezterm/*
cp ~/.config/wezterm/* ./wezterm/
cp ~/.config/starship.toml ./starship/
cp -r ~/.tmux/* ./tmux/.tmux/
cp ~/.tmux.conf ./tmux/
cp /Users/qianpeihua/Library/Application\ Support/Code/User/settings.json ./vscode/
cp /Users/qianpeihua/Library/Application\ Support/Code/User/keybindings.json ./vscode/
cp /Users/qianpeihua/Library/Application\ Support/Code/User/tasks.json ./vscode/
cp -r /Users/qianpeihua/Library/Application\ Support/Code/User/snippets ./vscode/


rm -rf ./tmux/.tmux/plugins/tpm/.git/
rm -rf ./tmux/.tmux/plugins/tmux-cpu/.git/
rm -rf ./tmux/.tmux/plugins/tmux-battery/.git/
rm -rf ./tmux/.tmux/plugins/tmux-net-speed/.git/

rm -rf ./dependency/npm-dependency/language-tools/.git/

