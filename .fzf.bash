# Setup fzf
# ---------

if [ "$(uname)" == "Darwin" ]; then
	if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
		export PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
	fi

	# Auto-completion
	# ---------------
	[[ $- == *i* ]] && source "/opt/homebrew/opt/fzf/shell/completion.bash" 2> /dev/null

	# Key bindings
	# ------------
	source "/opt/homebrew/opt/fzf/shell/key-bindings.bash"
fi

if [ "$(uname)" == "Linux" ]; then

	# Manjaro settings
	if [ -d "/usr/share/fzf" ]; then
		if [ -d "/usr/share/fzf/shell" ]; then
			# Auto-completion
			# ---------------
			[[ $- == *i* ]] && source "/usr/share/fzf/shell/completion.bash" 2> /dev/null

			# Key bindings
			# ------------
			source "/usr/share/fzf/shell/key-bindings.bash"
		else
			# Auto-completion
			# ---------------
			[[ $- == *i* ]] && source "/usr/share/fzf/completion.bash" 2> /dev/null

			# Key bindings
			# ------------
			source "/usr/share/fzf/key-bindings.bash"
		fi
	fi
fi
