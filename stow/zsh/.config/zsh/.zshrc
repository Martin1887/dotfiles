
# For dotfiles
export XDG_CONFIG_HOME="$HOME/.config"
# For specific data
export XDG_DATA_HOME="$HOME/.local/share"
# For cached files
export XDG_CACHE_HOME="$HOME/.cache"
# Add .cargo/bin to PATH
PATH=$PATH:$HOME/.cargo/bin

export EDITOR="nvim"
export VISUAL="nvim"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
# History filepath
export HISTFILE="$ZDOTDIR/.zhistory"
# Maximum events for internal history
export HISTSIZE=10000
# Maximum events in history file
export SAVEHIST=10000

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' expand prefix
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/baldoseo/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
setopt beep nomatch
unsetopt autocd extendedglob notify
bindkey -v
# End of lines configured by zsh-newuser-install
#

export KEYTIMEOUT=1

fpath=($ZDOTDIR/external $fpath)

# Autocomplete hidden files
_comp_options+=(globdots)
source ~/.config/zsh/external/completion.zsh

autoload -Uz cursor_mode && cursor_mode
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Caution, this path changes in different Linux distributions
# TODO: adjust the path in function of the distribution
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


source ~/.config/zsh/external/bd.zsh

source ~/.config/zsh/external/broot_tree.zsh
source ~/.config/zsh/external/broot.zsh

# Push the current directory visited on to the stack.
setopt AUTO_PUSHD
# Do not store duplicate directories in the stack.
setopt PUSHD_IGNORE_DUPS
# Do not print the directory stack after using pushd or popd.
setopt PUSHD_SILENT

alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

# fzf
# - CTRL+t to search files in subdirectories
# - CTRL+r to search in history
# - ALT+c to navigate into a sub-directory
if [ $(command -v "fzf") ]; then
  # Caution, this path does not exist in some Linux distributions
  # TODO: adjust the path in function of the distribution
  # source /usr/share/fzf/completion.zsh
  source /usr/share/zsh/site-functions/fzf
  # Cuation, this path changes in different Linux distributions
  # TODO: adjust the path in function of the distribution
  # source /usr/share/fzf/key-bindings.zsh
  source /usr/share/fzf/shell/key-bindings.zsh
fi
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# bat theme
export BAT_THEME=zenburn

# Fast Downward CPLEX environment variables
export cplex_DIR=/opt/ibm/ILOG/CPLEX_Studio1210/cplex
export DOWNWARD_CPLEX_ROOT=/opt/ibm/ILOG/CPLEX_Studio1210/cplex
export DOWNWARD_COIN_ROOT=/opt/coin/Osi-0.107.9

# aliases
alias wezterm="flatpak run org.wezfurlong.wezterm"
alias foliate="/usr/bin/com.github.johnfactotum.Foliate"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
