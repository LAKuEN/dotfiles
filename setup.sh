#!/bin/bash
echo 'export XDG_CONFIG_HOME="$HOME/.config"' >> $HOME/.bashrc && source $HOME/.bashrc
mkdir -p $XDG_CONFIG_HOME

# Vim
ln -nfs $HOME/repo/dotfiles/vim/.vim $HOME/.vim
ln -nfs $HOME/repo/dotfiles/vim/.vimrc $HOME/.vimrc

# NeoVim
ln -nfs $HOME/repo/dotfiles/vim/.vim $XDG_CONFIG_HOME/nvim
ln -nfs $HOME/repo/dotfiles/vim/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
