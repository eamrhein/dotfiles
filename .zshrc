if [[ -n $GHOSTTY_RESOURCES_DIR ]]; then
  source "$GHOSTTY_RESOURCES_DIR"/shell-integration/zsh/ghostty-integration
fi

# Basic Settings
export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="less"

#Defaults

setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt AUTO_CD
setopt CORRECT


#globbing bahavior
setopt EXTENDED_GLOB
setopt NO_BEEP



# Created by newuser for 5.9

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust
### End of Zinit's installer chunk

# ------------------------------
# COMPLETION INIT (with fzf-tab)
# ------------------------------

# Load fzf-tab *before* compinit
zinit light Aloxaf/fzf-tab

# Then initialize completion system
autoload -Uz compinit
zmodload zsh/complist
zstyle ':completion:*' menu select
compinit


zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions 
zinit light zsh-users/zsh-completions 
zinit light zsh-users/zsh-history-substring-search


# fzf Ctrl+R reverse search for command history
if [[ -n $(command -v fzf) ]]; then
  bindkey '^R' fzf-history-widget
  # Define the widget function
  fzf-history-widget() {
    local selected
    selected=$(fc -rl 1 | fzf +s --tac +m --preview='echo {}' --height=40%)
    if [[ -n $selected ]]; then
      BUFFER=${selected#* }  # Remove leading line number and space
      CURSOR=${#BUFFER}
      zle redisplay
    fi
  }
  zle -N fzf-history-widget
fi

# ------------------------------
# ALIASES & FUNCTIONS
# ------------------------------

alias ll='ls -alF --color=auto'
alias la='ls -A'
alias l='ls -CF'
alias gs='git status'
alias gc='git commit'
alias vim='nvim'
alias grep='grep --color=auto'
alias reload='source ~/.zshrc'

# Script-friendly path
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"

eval "$(starship init zsh)"
