################################################################################
#
#                 █           █           █  █
#                 █           █           █
#                 ███ ███ ███ ███     ███ █  █ ███ ███ ███ ███
#                 █ █   █ █   █ █       █ █  █   █ █   ███ █
#                 █ █ ███   █ █ █     ███ █  █ ███   █ █     █
#               █ ███ ███ ███ █ █ ███ ███ ██ █ ███ ███ ███ ███
#
# Jonathan Lowe
################################################################################

alias :q="exit"

alias vi=vim
#alias vim=nvim
alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dgit='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

if [ -x /usr/bin/nmtui ]; then
	alias wifi="nmtui"
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
