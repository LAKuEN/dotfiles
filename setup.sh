#!/bin/bash
# install g++-12
# fix clangd error: `'iostream' file not found`
# * https://github.com/clangd/clangd/issues/617
# * https://github.com/clangd/clangd/issues/1394
# * https://stackoverflow.com/questions/54521402/locating-iostream-in-clang-fatal-error-iostream-file-not-found
# => https://unix.stackexchange.com/questions/720734/how-to-install-g12-on-ubuntu-20-04
sudo apt update && sudo apt install -y g++-12

# install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir -p ~/.config/nvim
ln -sf $(pwd)/.config/nvim/init.vim ~/.config/nvim/init.vim
