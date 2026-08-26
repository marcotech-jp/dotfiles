#!/bin/bash
cd "$(dirname "$0")"

mkdir -p "$HOME/.config"

# general
ln -sf ${PWD}/.vimrc ~/.vimrc
ln -sf ${PWD}/.alias ~/.alias
ln -sf ${PWD}/.npmrc ~/.npmrc
ln -sf ${PWD}/commitlint.config.js ~//commitlint.config.js

# shell
ln -sf ${PWD}/.bashrc ~/.bashrc
# echo "source ~/.bashrc" >> ~/.bash_profile
ln -sf ${PWD}/.zshrc ~/.zshrc
ln -sf ${PWD}/.p10k.zsh ~/.p10k.zsh

ln -sf ${PWD}/.config/nvim ~/.config
ln -sf ${PWD}/.config/starship.toml ~/.config/starship.toml

mkdir -p ~/.config/git
cp -f ${PWD}/.config/git/config ~/.config/git/config
cp -f ${PWD}/.config/git/ignore ~/.config/git/ignore

# .config dir
shopt -s nullglob dotglob
settings_list=(bat ghostty herdr karabiner lazygit mise tmux uv wezterm)

for setting in "${settings_list[@]}"; do
  mkdir -p "$HOME/.config/$setting"
  for file in "$PWD/.config/$setting"/*; do
    [ -e "$file" ] || continue
    ln -sf "$file" "$HOME/.config/$setting/$(basename "$file")"
  done
done
