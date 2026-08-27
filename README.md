# dotfiles

## セットアップ

```sh
git clone https://github.com/marcotech-jp/dotfiles.git ~/dotfiles
cd ~/dotfiles

# macOSではCommand Line Toolsを先にインストールする。
xcode-select --install

# miseのインストールを含めて、マシンをセットアップする。
./setup.sh --update
```

`setup.sh` は mise がなければ `~/.local/bin/mise` にインストールし、リポジトリの
設定をtrustしてから `mise bootstrap` を実行する。再実行しても、すでに目的の
状態になっている項目はスキップされる。

ログインシェルの変更では `chsh` の認証を求められる場合がある。CIやコンテナなど
ログインシェルを変更できない環境では、userステップを除外する。

```sh
./setup.sh --skip user
```

既存ファイルと競合する場合は、変更内容をプレビューしてから置き換える。

```sh
./setup.sh --dry-run
./setup.sh --force-dotfiles
```

## bootstrapの対象

- powerlevel10k、zsh-autosuggestions、fast-syntax-highlightingのclone
- ホームディレクトリと `~/.config` 以下へのdotfileのsymlink
- マシンごとに編集できるGit設定のcopy
- `/bin/zsh` へのログインシェル変更
- `.config/mise/config.toml` で管理する開発ツールのインストール

管理しているツールはNode.js、Go、Bun、Python 3.13/3.11、uv、ruff、AWS CLI、
bat、eza、GitHub CLI、ghq、fzf、pre-commit、Neovim、ripgrep、fd、ImageMagick、
lazygit、usageである。

個別の状態を確認したり、一部だけを適用したりすることもできる。

```sh
./setup.sh status
./setup.sh --only dotfiles
./setup.sh --only repos
./setup.sh --only tools --update
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
