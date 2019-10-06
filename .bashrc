#!/bin/bash
################################################################################
#
#            .o8                          oooo
#           "888                          `888
#            888oooo.   .oooo.    .oooo.o  888 .oo.   oooo d8b  .ooooo.
#            d88' `88b `P  )88b  d88(  "8  888P"Y88b  `888""8P d88' `"Y8
#            888   888  .oP"888  `"Y88b.   888   888   888     888
#       .o.  888   888 d8(  888  o.  )88b  888   888   888     888   .o8
#       Y8P  `Y8bod8P' `Y888""8o 8""888P' o888o o888o d888b    `Y8bod8P'
#
# Jonathan Lowe
#
# External files
################################################################################

# Bash aliases
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# Bash functions
if [ -f ~/.bash_functions ]; then
    source ~/.bash_functions
fi

################################################################################
# Application Settings
################################################################################

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# User defined Below
export PATH="$PATH:/home/jonathanl/.cargo/bin"

# Opam config
eval "$(opam config env)"

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Base16 Shell colors
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

base16_classic-dark

################################################################################
# Shell Customization
################################################################################

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=100000

# append to the history file, don't overwrite it
shopt -s histappend

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Colorizes the bash prompt if it is supported.
ncolors=$(tput colors)
if test -t 1 && test -n "$ncolors" && test "$ncolors" -ge 8; then
	export PS1="\[\e[34m\]\w\[\e[97m\]\[\e[33m\]\$(parse_git_branch)\[\e[97m\] >\[\e[0m\] "
else
	export PS1="\w\$(parse_git_branch) > "
fi

export EDITOR='vim'
export TERM=xterm-256color

