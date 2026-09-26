# dotfiles

## セットアップ

mise 2026.9.14 以降と Git を事前に手動でインストールする。
<https://mise.jdx.dev/>

macOS では Command Line Tools も先にインストールする。

```sh
xcode-select --install
```

リポジトリを取得してセットアップする（SSH 認証が必要）。

```sh
mise bootstrap --from git@github.com:marcotech-jp/dotfiles.git \
  --from-dir ~/work/github.com/marcotech-jp/dotfiles
```

SSH 認証を使わない場合は URL を `https://github.com/marcotech-jp/dotfiles.git` に置き換える。

設定は用途ごとに分ける。

- `mise.toml`: OS パッケージ、リポジトリ、ログインシェル、dotfiles の配置。
- `.config/mise/config.toml`: 日常利用するツールと mise の設定。`~/.config/mise/config.toml` にリンクされる。

clone したディレクトリは設定の参照元なので削除しない。
ツール設定はどのディレクトリでも利用できる。
セットアップの再実行は checkout 内の `mise bootstrap` または `--from` で行う。

既存の checkout からは次のように実行できる。

```sh
cd ~/work/github.com/marcotech-jp/dotfiles
mise trust
mise bootstrap

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

## CI

GitHub Actions では Ubuntu 24.04 上で `--from` によるセットアップと再適用を確認する。
インストール後は checkout 外から Bash・Zsh で alias ファイルを読み込み、
`gh --version`、`node --version` と、alias の `g --version`、`py --version`、
`ll --version` を実行する。ツールの実行パスも mise が管理するものと一致するか確認する。
ホスト環境のログインシェルは変更できないため、user ステップは除外している。

## リポジトリのGit設定

必要に応じてclone後に設定する。

```sh
git config --local user.name "Marco"
git config --local user.email "17253707+marcotech-jp@users.noreply.github.com"
```
