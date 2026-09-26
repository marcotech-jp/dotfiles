#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

if command -v mise >/dev/null 2>&1; then
  mise_bin="$(command -v mise)"
elif [[ -x "$HOME/.local/bin/mise" ]]; then
  mise_bin="$HOME/.local/bin/mise"
else
  printf '%s\n' 'mise が見つかりません。README.md の手順に従って手動でインストールしてください。' >&2
  exit 1
fi

"$mise_bin" trust .config/mise/config.toml
exec "$mise_bin" bootstrap "$@"
