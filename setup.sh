if [ $(echo $SHELL) = "/usr/bin/bash" ]; then
    sudo ln -nfs $HOME/repo/dotfiles/.bashrc $HOME/.bashrc
    shopt -s expand_aliases
    source $HOME/.bashrc
fi

if [ $(echo $SHELL) = "/usr/bin/zsh" ]; then
    sudo ln -nfs $HOME/repo/dotfiles/.zshrc $HOME/.zshrc
    sudo ln -nfs $HOME/repo/dotfiles/.zshenv $HOME/.zshenv
    sudo ln -nfs $HOME/repo/dotfiles/.zpreztorc $HOME/.zpreztorc
    source $HOME/.zshrc
    source $HOME/.zshenv
    source $HOME/.zpreztorc
fi

sudo ln -nfs $HOME/repo/dotfiles/.tmux.conf $HOME/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf
# このスクリプトの実行後にtmuxのプラグインを入れるために、<C-j>Iをtmux上で押下

git config --global core.editor nvim
git config --global core.quotepath false

mkdir -p $XDG_CONFIG_HOME
mkdir -p $XDG_CONFIG_HOME/nvim

# Vim
sudo ln -nfs $HOME/repo/dotfiles/vim/.vim $HOME/.vim
sudo ln -nfs $HOME/repo/dotfiles/vim/.vimrc $HOME/.vimrc

# NeoVim
sudo ln -nfs $HOME/repo/dotfiles/vim/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
