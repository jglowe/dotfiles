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

# cd "$HOME" || echo "$HOME variable is not set"

# Bash aliases
if [ -f "$HOME/.bash_aliases" ]; then
	source $HOME/.bash_aliases
fi

# Bash functions
if [ -f "$HOME/.bash_functions" ]; then
	source $HOME/.bash_functions
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

export TERM=screen-256color

################################################################################
# Application Settings
################################################################################

if [ "$(uname)" = "Darwin" ]  && [ -f /opt/homebrew/bin/brew ]; then
	print_module_status "homebrew" true
	eval "$(/opt/homebrew/bin/brew shellenv)"

	export PATH="/opt/homebrew/bin:$PATH"
else
	print_module_status "homebrew" false
fi

if [ -x "$(command -v nvim)" ]; then
	print_module_status "neovim" true
	alias vi=nvim
	alias vim=nvim
	export EDITOR=nvim
else
	print_module_status "neovim" false
	alias vi=vim
	export EDITOR=vim
fi

# User defined Below
if [ -f "$HOME/.cargo/env" ] || [ -x "$(command -v cargo)" ]; then
	print_module_status "cargo rust" true

	if [ -d "$HOME/.cargo/bin" ]; then
		export PATH="$PATH:$HOME/.cargo/bin"
	fi

	if [ -f "$HOME/.cargo/env" ]; then
		source "$HOME/.cargo/env"
	fi
else
	print_module_status "cargo rust" false
fi

if [ -f ~/.fzf.bash ] && [ -x "$(command -v fzf)" ]; then
	print_module_status "fzf" true
	source ~/.fzf.bash
else
	print_module_status "fzf" false
fi

# Opam config
if [ -x "$(command -v opam)" ]; then
	print_module_status "opam ocaml" true

	eval "$(opam env)"
else
	print_module_status "opam ocaml" false
fi

if [ -x "$(command -v doctl)" ]; then
	print_module_status "digitalocean ctl" true
	source $HOME/.doctl.bash
else
	print_module_status "digitalocean ctl" false
fi

if [ -f /opt/local/etc/profile.d/bash_completion.sh ] ||
	[ -f /opt/homebrew/etc/profile.d/bash_completion.sh ] ||
	[ -f /usr/share/bash-completion/bash_completion ]; then

	print_module_status "bash completion" true
	if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
		. /opt/local/etc/profile.d/bash_completion.sh
	fi
	if [ -f /opt/homebrew/etc/profile.d/bash_completion.sh ]; then
		. /opt/homebrew/etc/profile.d/bash_completion.sh
	fi

	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	fi
else
	print_module_status "bash completion" false
fi

if [ -x "$(command -v lua-language-server)" ]; then
	print_module_status "lua-language-server" true
else
	print_module_status "lua-language-server" false
fi

if [ -x "$(command -v lua-format)" ]; then
	print_module_status "lua-format" true
else
	print_module_status "lua-format" false
fi

if [ -x "$(command -v pyright)" ]; then
	print_module_status "pyright" true
else
	print_module_status "pyright" false
fi

if [ -x "$(command -v ansible-language-server)" ]; then
	print_module_status "ansible-language-server" true
else
	print_module_status "ansible-language-server" false
fi

if [ -x "$(command -v clangd)" ]; then
	print_module_status "clangd" true
else
	print_module_status "clangd" false
fi

if [ -x "$(command -v rust-analyzer)" ]; then
	print_module_status "rust-analyzer" true
else
	print_module_status "rust-analyzer" false
fi

if [ -x "$(command -v ocamllsp)" ]; then
	print_module_status "ocamllsp" true
else
	print_module_status "ocamllsp" false
fi

if [ -x "$(command -v autopep8)" ]; then
	print_module_status "autopep8" true
else
	print_module_status "autopep8" false
fi

if [ -x "$(command -v ansible-lint)" ]; then
	print_module_status "ansible-lint" true
else
	print_module_status "ansible-lint" false
fi

if [ -x "$(command -v clang-format)" ]; then
	print_module_status "clang-format" true
else
	print_module_status "clang-format" false
fi

if [ -x "$(command -v tmux)" ]; then
	print_module_status "tmux" true
else
	print_module_status "tmux" false
fi

export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$HOME/.dotnet:$HOME/.dotnet/tools

if [ -x "$(command -v dotnet)" ]; then
	print_module_status "dotnet" true
else
	print_module_status "dotnet" false
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Base16 Shell colors
# BASE16_SHELL="$HOME/.config/base16-shell"
# if [ -n "$PS1" ] && [ -s "$BASE16_SHELL/profile_helper.sh" ]; then
# 	print_module_status "base16 shell" true
#
# 	eval "$("$BASE16_SHELL/profile_helper.sh")"
# 	bash "$HOME/.config/base16-shell/scripts/base16-classic-dark.sh" base16_classic-dark
# else
# 	print_module_status "base16 shell" false
# fi

# BASE16_SHELL="$HOME/.config/base16-shell/"
# [ -n "$PS1" ] && \
#     [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
#         source "$BASE16_SHELL/profile_helper.sh"
#
# base16_classic-dark

# LSPs
if [ -x "$(command -v shellcheck)" ]; then
	print_module_status "shellcheck" true
else
	print_module_status "shellcheck" false
fi

