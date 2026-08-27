# dotfiles

```sh
git clone https://github.com/marcotech-jp/dotfiles.git ~/dotfiles
cd ~/dotfiles

# macOSではCommand Line Toolsを先にインストールする。
xcode-select --install

# miseのインストールを含めて、マシンをセットアップする。
./setup.sh --update
```

`setup.sh` は mise がなければインストールし、以降の処理を
`mise bootstrap` に委譲する薄いエントリーポイントである。再実行しても、すでに
目的の状態になっている項目はスキップされる。

既存ファイルと競合する場合は、変更内容をプレビューしてから置き換える。

```sh
mise bootstrap --dry-run
mise bootstrap --force-dotfiles
```

## bootstrapの対象

- Ubuntuの基本パッケージとmacOSのtmux
- UDEV Gothic 35NF、Migu 1M
- dotfileのsymlink（一部のGit設定はマシンごとに編集できるようcopy）
- powerlevel10k、zsh-autosuggestions、fast-syntax-highlighting
- zshをログインシェルに設定
- Bitwarden SSH Agent、CUDAの環境変数、共通SSHクライアント設定
- `.config/mise/config.toml` の開発ツール

個別の状態を確認したり、一部だけを適用したりすることもできる。

```sh
mise bootstrap status
mise bootstrap --only dotfiles
mise bootstrap --only packages --update
mise bootstrap --only tools
```

Docker、CUDA、SSH鍵やSSHサーバー、OSポリシーなど、マシンごとの判断が必要な
項目は [手動セットアップ](docs/manual-setup.md) に残している。

## リポジトリのGit設定

必要に応じてclone後に設定する。

```sh
git config --local user.name "Marco"
git config --local user.email "17253707+marcotech-jp@users.noreply.github.com"
```
