# dotfiles

my dotfiles

- shell: zsh
- Terminal: Ghostty
- Theme: Starship
- Multiplexer: herde
- Editor: Neovim

## セットアップ

mise 2026.9.14 以降と Git を事前に手動でインストールする。
<https://mise.jdx.dev/>

```sh
# HTTPS でリポジトリを取得してセットアップする（SSH 認証は不要）。
mise bootstrap --from https://github.com/marcotech-jp/dotfiles.git \
  --from-dir ~/work/github.com/marcotech-jp/dotfiles

# パッケージ情報と設定内のリポジトリを更新する。
mise bootstrap --update

# CIなど、ログインシェルを変更できない環境ではuserステップを除外する。
mise bootstrap --skip user

# 競合する既存の設定を上書きしてよい場合（必要なファイルは先にバックアップ）。
mise bootstrap --force-dotfiles
```

これらのオプションは `mise bootstrap --from ...` にも指定できる。
`--from` と `--update` を併用すると dotfiles の checkout 自体も更新する。
旧構成の `~/.config/mise/config.toml` と競合する場合も、バックアップしてから置き換える。

## リポジトリのGit設定

必要に応じてclone後に設定する。

```sh
git config --local user.name "Marco"
git config --local user.email "17253707+marcotech-jp@users.noreply.github.com"
```
