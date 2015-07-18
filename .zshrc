# User configuration
export EDITOR='vim'

# This apparently works everywhere. I could detect freebsd using freebsd*, and similar
if [[ "$OSTYPE" == "cygwin"* || "$OSTYPE" == "mingw"* ]]; then
	# On windows machines I use pageant, this passes it through to there. 
	eval $(/usr/bin/ssh-pageant -r -a "/tmp/.ssh-pageant-$USERNAME");
fi

# custom aliases
source ~/.dotfiles/.zshalias

source ~/.dotfiles/zshrccolouring.sh

# load zgen
source ~/.dotfiles/.zgen/zgen.zsh

# check if there's no init script
if ! zgen saved; then
	echo "Creating a zgen save"

	#plugins go here

	# An oh-my-zsh plugin to help remembering those aliases you defined once 
	zgen load djui/alias-tips

	# type in any part of any previously entered command and press the UP and DOWN arrow keys to cycle through the matching commands
	zgen load zsh-users/zsh-history-substring-search

	# Fish shell like syntax highlighting for Zsh
	zgen load zsh-users/zsh-syntax-highlighting

	# Additional completion definitions for Zsh
	zgen load zsh-users/zsh-completions src

	zgen save
fi;

# history search binding
# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# UP/DOWN arrow keys, fallback for Ubuntu 12.04, Fedora 21, and MacOSX 10.9
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# # bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

zstyle ':completion:*' menu select
[ -f /etc/DIR_COLORS ] && eval $(dircolors -b /etc/DIR_COLORS)
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}