#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

if command -v mise >/dev/null 2>&1; then
  mise_bin="$(command -v mise)"
elif [[ -x "$HOME/.local/bin/mise" ]]; then
  mise_bin="$HOME/.local/bin/mise"
else
  curl --fail --location --proto '=https' --tlsv1.2 https://mise.run | sh
  mise_bin="$HOME/.local/bin/mise"
fi

"$mise_bin" trust .config/mise/config.toml
exec "$mise_bin" bootstrap "$@"
