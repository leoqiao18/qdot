#!/usr/bin/env zsh

fpath=($ZDOTDIR/plugins $fpath)

# +------------+
# | NAVIGATION |
# +------------+
setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

source $ZDOTDIR/plugins/bd.zsh

# +---------+
# | HISTORY |
# +---------+

# setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
# setopt SHARE_HISTORY             # Share history between all sessions.
# setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
# setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
# setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
# setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
# setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
# setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
# setopt HIST_VERIFY               # Do not execute immediately upon history expansion.

# +---------+
# | ALIASES |
# +---------+

source $ZDOTDIR/aliases.zsh

autoload -U compinit; compinit

_comp_options+=(globdots) # with hidden files

# +--------+
# | PROMPT |
# +--------+

eval "$(starship init zsh)"

# +-----------+
# | VI KEYMAP |
# +-----------+

# Vi mode
bindkey -v
export KEYTIMEOUT=1

# Change cursor
source "$ZDOTDIR/plugins/cursor_mode"

# Add Vi text-objects for brackets and quotes
autoload -Uz select-bracketed select-quoted
zle -N select-quoted
zle -N select-bracketed
for km in viopp visual; do
  bindkey -M $km -- '-' vi-up-line-or-history
  for c in {a,i}${(s..)^:-\'\"\`\|,./:;=+@}; do
    bindkey -M $km $c select-quoted
  done
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $km $c select-bracketed
  done
done
# Emulation of vim-surround
autoload -Uz surround
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround
bindkey -M vicmd cs change-surround
bindkey -M vicmd ds delete-surround
bindkey -M vicmd ys add-surround
bindkey -M visual S add-surround
# Increment a number
autoload -Uz incarg
zle -N incarg
bindkey -M vicmd '^a' incarg

# +------------+
# | COMPLETION |
# +------------+

source $ZDOTDIR/completion.zsh

# +--------------+
# | LOCAL .zshrc |
# +--------------+

source $HOME/.zshrc

# +---------------------+
# | SYNTAX HIGHLIGHTING |
# +---------------------+

source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
