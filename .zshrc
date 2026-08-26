# -----------Powerlevel10k instant prompt-----------
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# -----------Environment-----------
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export PATH="$HOME/.local/bin:$PATH"

# -----------History-----------
export HISTFILE="$HOME/.zsh/.zsh_history"
export HISTSIZE=100000
export SAVEHIST=100000

setopt EXTENDED_HISTORY
setopt SHARE_HISTORY

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_NO_STORE
setopt HIST_VERIFY

# -----------Shell behavior-----------
setopt INTERACTIVE_COMMENTS
setopt AUTO_CD

# -----------Completion-----------
fpath=("$HOME/.zsh/completions" $fpath)

autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}'

# -----------Theme-----------
autoload -U colors
colors

source "$HOME/.zsh/powerlevel10k/powerlevel10k.zsh-theme"
[[ -f "$HOME/.p10k.zsh" ]] && source "$HOME/.p10k.zsh"

# -----------Plugins-----------
source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"

# -----------Toolchain-----------
eval "$(mise activate zsh)"
if [[ "$(uname -s)" == "Darwin" ]]; then
  export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
fi

# uv
export UV_MALWARE_CHECK=1
export UV_EXCLUDE_NEWER="7 days"

if command -v uv >/dev/null 2>&1; then
  eval "$(uv generate-shell-completion zsh)"
fi

# editor
if command -v nvim >/dev/null 2>&1; then
  export EDITOR=nvim
  export VISUAL=nvim
else
  export EDITOR=vim
  export VISUAL=vim
fi

# -----------Aliases-----------
[[ -f "$HOME/.alias" ]] && source "$HOME/.alias"

# -----------ghq + fzf-----------
function ghq-fzf() {
  local src=$(ghq list | fzf --preview "bat --color=always --style=header,grid --line-range :80 $(ghq root)/{}/README.*")
  if [ -n "$src" ]; then
    BUFFER="cd $(ghq root)/$src"
    zle accept-line
  fi
  zle -R -c
}
zle -N ghq-fzf
bindkey '^g' ghq-fzf
