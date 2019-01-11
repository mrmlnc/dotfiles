#!/usr/bin/env bash

# Aliases
alias wd="cd ~/Documents"
alias wg="cd ~/Documents/GitHub"
alias wo="cd ~/Documents/OpenSource"
alias wt="cd ~/Documents/Texts"
alias wts="cd ~/Documents/Tests"
alias ws="cd ~/Documents/Sandbox"
alias gti="git $1"

# Easier navigation: .., ... and ~
alias ..="cd .."
alias ...="cd ../.."
alias ~="cd ~"

# LS flags
alias ls='ls -hFGA'
alias ll='ls -l'

# Always enable colored `grep` output
alias grep='grep --color=auto'

# Applications
alias safari="open -a safari"
alias site="open -a safari $1"

# System
alias lock='pmset displaysleepnow'
