#!/bin/bash
shopt -s expand_aliases
source ubuntu_setup.sh

echo 'export XDG_CONFIG_HOME="$HOME/.config"' | sudo tee -a $HOME/.bashrc
echo 'export XDG_CONFIG_HOME="$HOME/.config"' | sudo tee -a $HOME/.zshrc
source $HOME/.bashrc
source $HOME/.zshrc
mkdir -p $XDG_CONFIG_HOME
mkdir -p $XDG_CONFIG_HOME/nvim

# Vim
sudo ln -nfs $HOME/repo/dotfiles/vim/.vim $HOME/.vim
sudo ln -nfs $HOME/repo/dotfiles/vim/.vimrc $HOME/.vimrc

# NeoVim
# sudo ln -nfs $HOME/repo/dotfiles/vim/.vim $XDG_CONFIG_HOME/nvim
sudo ln -nfs $HOME/repo/dotfiles/vim/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
