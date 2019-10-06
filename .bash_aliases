################################################################################
#                   .o8                          oooo
#                  "888                          `888
#                   888oooo.   .oooo.    .oooo.o  888 .oo.
#                   d88' `88b `P  )88b  d88(  "8  888P"Y88b
#                   888   888  .oP"888  `"Y88b.   888   888
#                   888   888 d8(  888  o.  )88b  888   888
#                   `Y8bod8P' `Y888""8o 8""888P' o888o o888o
#
#
#                   oooo   o8o
#                   `888   `"'
#          .oooo.    888  oooo   .oooo.    .oooo.o  .ooooo.   .oooo.o
#         `P  )88b   888  `888  `P  )88b  d88(  "8 d88' `88b d88(  "8
#          .oP"888   888   888   .oP"888  `"Y88b.  888ooo888 `"Y88b.
#         d8(  888   888   888  d8(  888  o.  )88b 888    .o o.  )88b
#         `Y888""8o o888o o888o `Y888""8o 8""888P' `Y8bod8P' 8""888P'
#
# Jonathan Lowe
################################################################################

alias :q="exit"

alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dgit='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
