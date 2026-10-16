#!/bin/zsh

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Translate (EN/JA)
# @raycast.mode fullOutput
# @raycast.packageName Claude

# Optional parameters:
# @raycast.icon 🌐
# @raycast.argument1 { "type": "text", "placeholder": "翻訳したい文字列" }

export PATH="$HOME/.local/bin:/opt/homebrew/bin:$PATH"

claude -p \
  --model haiku \
  --tools "" \
  --no-session-persistence \
  --disable-slash-commands \
  --system-prompt "入力された文章を翻訳する。出力は翻訳した文章だけ、他のメッセージや説明や前置きは書かない。
入力が日本語なら英語に翻訳し、入力が英語ならその逆にする。" \
  "$1"
