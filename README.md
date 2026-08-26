# README

```sh
git clone https://github.com/marcotech-jp/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Macの場合はxcode-selectを先に実行する。
xcode-select --install
./setup.sh

# GitHubのユーザ名とメールアドレスを設定する。
git config --local user.name "Marco"
git config --local user.email "17253707+marcotech-jp@users.noreply.github.com"

# install zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.zsh/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ~/.zsh/fast-syntax-highlighting
chsh -s /bin/zsh

# install mise
curl https://mise.run | sh
```
