# CapsLock to Ctrl
echo 'XKBOPTIONS="ctrl:nocaps"' | sudo tee -a /etc/default/keyboard &> /dev/null
# translate directory names in $HOME in English
LANG=C xdg-user-dirs-update --force

# install
sudo add-apt-repository ppa:neovim-ppa/stable -y
sudo add-apt-repository ppa:teejee2008/ppa -y
sudo apt update
sudo apt install -y curl

curl -L -O https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

sudo sh -c "curl https://build.opensuse.org/projects/home:manuelschneid3r/public_key | sudo apt-key add -"
sudo apt update
sudo apt install -y albert

sudo apt update
sudo apt install -y asunder chrome-gnome-shell clamav-base clamav-freshclam davfs2 dkms exfat-fuse exfat-utils fcitx-mozc ffmpeg fonts-ricty-diminished gimp git gnome-shell gnome-sushi gnome-tweak-tool gnome-tweaks golang gparted gucharmahp imagemagick jq neovim nodejs octave python3 python3-pip python3-venv solaar tig timeshift tlp tlp-rdw tmux translate-shell tree vim virtualbox zsh
# ネットワーク接続系
# VPN
sudo apt install network-manager-openconnect-gnome
sudo systemctl daemon-reload
# https://cloudpack.media/14148 のUbuntuの手順での証明書の導入

chsh -s $(which zsh)

im-config -n fcitx
sudo -H pip3 install pynvim

mkdir $HOME/repo && cd $HOME/repo
cd $HOME/repo
git clone https://github.com/LAKuEN/dotfiles.git
shopt -s expand_aliases

# golang
curl -L -O https://dl.google.com/go/go1.12.1.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.12.1.linux-amd64.tar.gz

# 絵文字対応のフォント突っ込む
curl -O https://github.com/miiton/Cica/releases/download/v4.1.1/Cica-v4.1.1.zip
unzip Cica-v4.1.1.zip
sudo cp Cica-*.ttf /usr/local/share/fonts
fc-list | grep Cica
## Gnome-terminalにも反映
UUID=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d \')
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ font "Cica Bold 11"
rm Cica-v4.1.1.zip Cica-*.ttf

source setup.sh

# set keybinding in mozc with gui
# * Alt: IME ON/OFF
# set keybinding in setting
# * Ctrl+Alt+h,l: move current window

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
