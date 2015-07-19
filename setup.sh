#!/bin/bash
[[ -h "~/.tmux.conf" ]] && rm ~/.tmux.conf
[[ -f "~/.tmux.conf" ]] && mv ~/.tmux.conf ~/.tmux.conf.original

[[ -h "~/.vimrc" ]] && rm ~/.vimrc
[[ -f "~/.vimrc" ]] && mv ~/.vimrc ~/.vimrc.original

[[ -h "~/.zshrc" ]] && rm ~/.zshrc
[[ -f "~/.zshrc" ]] && mv ~/.zshrc ~/.zshrc.original

ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.zshrc ~/.zshrc
