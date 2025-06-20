# Created by fortura
# zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
# plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light MichaelAquilina/zsh-you-should-use
# snippets
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found
zinit snippet OMZP::git

# Load completions
autoload -Uz compinit && compinit
zinit cdreplay -q

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
setopt APPEND_HISTORY SHARE_HISTORY EXTENDED_HISTORY
setopt HIST_IGNORE_SPACE HIST_IGNORE_DUPS HIST_IGNORE_ALL_DUPS HIST_FIND_NO_DUPS HIST_SAVE_NO_DUPS

# Options
setopt AUTO_CD AUTO_PUSHD PUSHD_IGNORE_DUPS
unsetopt BEEP

# Completion Styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls -F $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls -F $realpath'

# Aliases
[[ -f ~/.zsh_aliases ]] && source ~/.zsh_aliases 

# Shell integrations
eval "$(starship init zsh)"
source <(fzf --zsh)
eval "$(zoxide init --cmd cd zsh)"

# Updates
UPDATE_MARKER="$HOME/.cache/last-update"
if [[ ! -f $UPDATE_MARKER || $(( $(date +%s) - $(< $UPDATE_MARKER) )) -gt 753159 ]]; then
  echo "Zinit updating..."
  cd ~
  zinit self-update

  echo "Updating zinit plugins..."
  zinit update --all
  zinit delete --clean

  if [ -d "$HOME/.tmux/plugins/tpm" ]; then
    echo "tpm updating..."
    git -C "$HOME/.tmux/plugins/tpm" pull --ff-only
  fi

  date +%s > $UPDATE_MARKER
  echo "Done!"
fi
