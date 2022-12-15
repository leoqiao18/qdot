#!/usr/bin/env zsh

alias g='git'
alias gs='git status'
alias ga='git add'
alias gaa='git add -A'
alias gb='git branch'
alias gc='git commit'
alias gcm='git commit -m'
alias gco='git checkout'
alias gd='git diff'
alias gl='git log'
alias gr='git remote'
alias grs='git remote show'
alias glo='git log --oneline'
alias glol='git log --graph --oneline --decorate'

if command -v exa >/dev/null; then
  alias l='exa -F --icons'
  alias ll='exa -alF --icons'
  alias la='exa -aF --icons'
fi
