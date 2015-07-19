#!/usr/bin/env zsh
git submodule init
git submodule update

[[ -h ~/.tmux.conf ]] && rm ~/.tmux.conf
[[ -f ~/.tmux.conf ]] && mv ~/.tmux.conf ~/.tmux.conf.original

[[ -h ~/.vim ]] && rm ~/.vim
[[ -d ~/.vim ]] && mv ~/.vim ~/.vim.original

[[ -h ~/.vimrc ]] && rm ~/.vimrc
[[ -f ~/.vimrc ]] && mv ~/.vimrc ~/.vimrc.original

[[ -h ~/.zshrc ]] && rm ~/.zshrc
[[ -f ~/.zshrc ]] && mv ~/.zshrc ~/.zshrc.original

[[ -d ~/.zgen ]] && rm -rf ~/.zgen

ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.vim ~/.vim

source ~/.zshrc
