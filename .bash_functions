#!/bin/bash
################################################################################
#
#             █           █        ██                 █
#             █           █        █               █
#             ███ ███ ███ ███     ███ █ █ ███ ███ ███ █ ███ ███ ███
#             █ █   █ █   █ █      █  █ █ █ █ █    █  █ █ █ █ █ █
#             █ █ ███   █ █ █      █  █ █ █ █ █    █  █ █ █ █ █   █
#           █ ███ ███ ███ █ █ ███  █  ███ █ █ ███  ██ █ ███ █ █ ███
#
# Jonathan Lowe
################################################################################

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
NC=$(tput sgr0)

print_module_status() {
	local name=$1
	local succeeded=$2

	if [ "$succeeded" = "true" ]; then
		printf "[  ${GREEN}OK${NC}  ] %s\n" "$name"
	else
		printf "[${RED}FAILED${NC}] %s\n" "$name"
	fi
}
