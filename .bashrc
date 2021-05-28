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

cd "$HOME" || echo "$HOME variable is not set"

# Bash aliases
if [ -f .bash_aliases ]; then
    source .bash_aliases
fi

# Bash functions
if [ -f .bash_functions ]; then
    source .bash_functions
fi

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
	export PS1="[\u@\h \[\e[34m\]\W\[\e[97m\]]\[\e[33m\]\$(parse_git_branch)\[\e[97m\] \\$\[\e[0m\] "
else
	export PS1="[\u@\h \W]\$(parse_git_branch) \\$ "
fi

export PATH="$PATH:$HOME/bin"

export EDITOR=nvim
export TERM=xterm-256color

################################################################################
# Application Settings
################################################################################

# make less more friendly for non-text input files, see lesspipe(1)
if [ -x /usr/bin/lesspipe ]; then
	echo "[✅ lesspipe]"
	eval "$(SHELL=/bin/sh lesspipe)"
else
	echo "[❌ lesspipe]"
fi

# User defined Below
if [ -f "$HOME/.cargo/env" ] || [ -x "$(which cargo)" ]; then
	echo "[✅ cargo rust]"
	if [ -f "$HOME/.cargo/env" ]; then
		export PATH="$PATH:$HOME/.cargo/bin"

		source "$HOME/.cargo/env"
	fi
else
	echo "[❌ cargo rust]"
fi

if [ -f ~/.fzf.bash ] && [ -x "$(which fzf)" ]; then
	echo "[✅ fzf]"
	source ~/.fzf.bash
else
	echo "[❌ fzf]"
fi

if [ -f /opt/homebrew/bin/brew ]; then
	echo "[✅ homebrew]"
	eval $(/opt/homebrew/bin/brew shellenv)

	export PATH="/opt/homebrew/bin:$PATH"
else
	echo "[❌ homebrew]"
fi

# Opam config
if [ -x "$(which opam)" ]; then
	echo "[✅ opam ocaml] "
	eval "$(opam config env)"
else
	echo "[❌ opam ocaml] "
fi

if [ -f /opt/local/etc/profile.d/bash_completion.sh ] || [ -f /opt/homebrew/etc/profile.d/bash_completion.sh ]; then
	echo "[✅ bash completion] "
	if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
		. /opt/local/etc/profile.d/bash_completion.sh
	fi
	if [ -f /opt/homebrew/etc/profile.d/bash_completion.sh ]; then
		. /opt/homebrew/etc/profile.d/bash_completion.sh
	fi
else
	echo "[❌ bash completion] "
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Base16 Shell colors
BASE16_SHELL="$HOME/.config/base16-shell/"
if [ -n "$PS1" ] && [ -s "$BASE16_SHELL/profile_helper.sh" ]; then
	echo "[✅ base16 shell] "

    eval "$("$BASE16_SHELL/profile_helper.sh")"
	base16_classic-dark
else
	echo "[❌ base16 shell] "
fi


