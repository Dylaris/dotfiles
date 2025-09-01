# ~/.bashrc: executed by bash for non-login shells

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# ========================
# History Configuration
# ========================
# Don't put duplicate lines or lines starting with space in history
HISTCONTROL=ignoreboth

# Append to history file, don't overwrite it
shopt -s histappend

# Set history size
HISTSIZE=1000
HISTFILESIZE=2000

# ========================
# Shell Behavior
# ========================
# Check window size after each command
shopt -s checkwinsize

# Make less more friendly for non-text input files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# ========================
# Prompt Configuration
# ========================
# Set a colorful prompt with timestamp
PS1="[\[\033[01;31m\]\t\[\033[00m\]] \[\033[01;32m\]\u\[\033[00m\] -> \[\033[01;33m\]\W\[\033[00m\] "

# For xterm and rxvt, use the same prompt format
case "$TERM" in
xterm*|rxvt*)
    PS1="[\[\033[01;31m\]\t\[\033[00m\]] \[\033[01;32m\]\u\[\033[00m\] -> \[\033[01;33m\]\W\[\033[00m\] "
    ;;
*)
    ;;
esac

# ========================
# Color Support & Aliases
# ========================
# Enable color support for ls and grep
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Useful ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# ========================
# Environment Variables
# ========================
# export PATH=$PATH:...

# ========================
# Shell Options
# ========================
# Disable core dumps
ulimit -c 0

# Use vi-style command line editing
set -o vi

# ========================
# Additional Configurations
# ========================
# Load aliases if exists
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Enable programmable completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
