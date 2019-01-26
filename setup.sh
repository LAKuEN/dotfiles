#!/bin/bash

if [ $(echo $SHELL) = "/usr/bin/bash" ]; then
    sudo ln -nfs $HOME/repo/dotfiles/.bashrc $HOME/.bashrc
    echo 'export XDG_CONFIG_HOME="$HOME/.config"' | sudo tee -a $HOME/.bashrc
    shopt -s expand_aliases
    source $HOME/.bashrc
fi

if [ $(echo $SHELL) = "/usr/bin/zsh" ]; then
    sudo ln -nfs $HOME/repo/dotfiles/.zshrc $HOME/.zshrc
    sudo ln -nfs $HOME/repo/dotfiles/.zshenv $HOME/.zshenv
    sudo ln -nfs $HOME/repo/dotfiles/.zpreztorc $HOME/.zpreztorc
    echo 'export XDG_CONFIG_HOME="$HOME/.config"' | sudo tee -a $HOME/.zshrc
    source $HOME/.zshrc
    source $HOME/.zshenv
    source $HOME/.zpreztorc
fi
# 絵文字対応のフォント突っ込む
curl -O https://github.com/miiton/Cica/releases/download/v4.1.1/Cica-v4.1.1.zip
unzip Cica-v4.1.1.zip
sudo cp Cica-*.ttf /usr/local/share/fonts
fc-list | grep Cica
rm Cica-v4.1.1.zip Cica-*.ttf

sudo ln -nfs $HOME/repo/dotfiles/.tmux.conf $HOME/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf

git config --global core.editor nvim

mkdir -p $XDG_CONFIG_HOME
mkdir -p $XDG_CONFIG_HOME/nvim

# Vim
sudo ln -nfs $HOME/repo/dotfiles/vim/.vim $HOME/.vim
sudo ln -nfs $HOME/repo/dotfiles/vim/.vimrc $HOME/.vimrc

# NeoVim
sudo ln -nfs $HOME/repo/dotfiles/vim/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
