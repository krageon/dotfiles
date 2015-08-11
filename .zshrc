# User configuration
export EDITOR='vim'

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

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
# LS_COLORS is defined, so something must have gone well there.
[ -n "$LS_COLORS" ] && zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# If it is not defined, we can still get colour using an empty string
[ -z "$LS_COLORS" ] && zstyle ':completion:*' list-colors ""

# Command history configuration
if [ -z "$HISTFILE" ]; then
	HISTFILE=$HOME/.zsh_history
fi

HISTSIZE=10000
SAVEHIST=10000

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data

# key bindings
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\ee[C" forward-word
bindkey "\ee[D" backward-word
bindkey "^H" backward-delete-word
# for rxvt
bindkey "\e[8~" end-of-line
bindkey "\e[7~" beginning-of-line
# for non RH/Debian xterm, can't hurt for RH/DEbian xterm
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
# for freebsd console
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line



bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[5~" history-beginning-search-backward
bindkey "\e[6~" history-beginning-search-forward
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert
bindkey "\e[5C" forward-word
bindkey "\e[5D" backward-word
bindkey "\e[1;5C" forward-word
bindkey "\e[1;5D" backward-word

# for rxvt
bindkey "\e[8~" end-of-line
bindkey "\eOc" forward-word
bindkey "\eOd" backward-word

# for non RH/Debian xterm, can't hurt for RH/DEbian xterm
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line

# for freebsd console
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
