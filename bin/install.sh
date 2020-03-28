#!/bin/bash

set -eo pipefail

DOTFILES_REPO="git@github.com:jglowe/dotfiles.git"

function dgit () {
	git --git-dir "$HOME/.dotfiles/" --work-tree="$HOME" "$@"
}

if [ ! -d "$HOME/.dotfiles/" ]; then
	git clone --bare "DOTFILES_REPO" "$HOME/.dotfiles"
fi

if ! files=$(dgit checkout master 2>&1); then
	echo "Backing up files to $HOME/.dotfiles-backup"
	mkdir -p "$HOME/.dotfiles-backup"
	echo "$files" | grep -P "^\t" | xargs -I % sh -c "mv % $HOME/.dotfiles-backup"
	echo "Moved all the conflicting files to $HOME/.dotfiles-backup"
	dgit checkout
fi

dgit submodule update --init

dgit config --local status.showUntrackedFiles no
dgit config --local core.bare false

chmod 700 ~/.ssh
chmod 600 ~/.ssh/config
