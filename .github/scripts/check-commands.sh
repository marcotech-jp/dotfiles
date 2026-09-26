#!/usr/bin/env bash
# Run with both Bash and Zsh under mise exec, outside the checkout.
set -e

if [ -n "${BASH_VERSION:-}" ]; then
  shopt -s expand_aliases
fi
source "${XDG_CONFIG_HOME:-$HOME/.config}/alias"

# Do not accidentally pass using tools preinstalled on the CI runner.
for tool in gh node python3 eza; do
  test "$(command -v "$tool")" = "$(mise which "$tool")"
done

gh --version
node --version
alias g py ll
g --version
py --version
ll --version
