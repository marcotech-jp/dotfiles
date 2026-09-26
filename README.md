# dotfiles

## セットアップ

mise は事前に手動でインストールする。
<https://mise.jdx.dev/>

```sh
mkdir -p  ~/work/github.com/marcotech-jp
cd  ~/work/github.com/marcotech-jp
git clone https://github.com/marcotech-jp/dotfiles.git
cd ~/dotfiles
./setup.sh

# macOSではCommand Line Toolsを先にインストールする。
xcode-select --install

# マシンをセットアップする。
./setup.sh --update

# ログインシェルの変更では `chsh` の認証を求められる場合がある。CIやコンテナなど
# ログインシェルを変更できない環境では、userステップを除外する。
./setup.sh --skip user
```

## CI

GitHub ActionsではUbuntu 24.04上で `setup.sh` の構文確認とbootstrapのスモーク
テストを行う。ホスト環境のログインシェルは変更できないため、userステップは
除外している。

## リポジトリのGit設定

必要に応じてclone後に設定する。

```sh
git config --local user.name "Marco"
git config --local user.email "17253707+marcotech-jp@users.noreply.github.com"
```
