# Setup fzf
# ---------
if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]] && [ -d /opt/homebrew/opt/fzf/bin ]; then
	export PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
	# Auto-completion
	# ---------------
	[[ $- == *i* ]] && source "/opt/homebrew/opt/fzf/shell/completion.bash" 2> /dev/null

	# Key bindings
	# ------------
	source "/opt/homebrew/opt/fzf/shell/key-bindings.bash"
fi

if [[ ! "$PATH" == */usr/share/fzf* ]] && [ -d /usr/share/fzf ]; then
	export PATH="${PATH:+${PATH}:}/usr/share/fzf"
	# Auto-completion
	# ---------------
	[[ $- == *i* ]] && source "/usr/share/fzf/completion.bash" 2> /dev/null

	# Key bindings
	# ------------
	source "/usr/share/fzf/key-bindings.bash"
fi
