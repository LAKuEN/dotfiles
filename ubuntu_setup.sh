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

sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_18.04/ /' > /etc/apt/sources.list.d/home:manuelschneid3r.list"
sudo apt-get update
sudo apt-get install albert

sudo apt update
sudo apt install -y asunder chrome-gnome-shell clamav-base clamav-freshclam dkms exfat-fuse exfat-utils fcitx-mozc ffmpeg gimp git gnome-shell gnome-sushi gnome-tweak-tool gnome-tweaks gparted imagemagick jq neovim nodejs octave python3 python3-pip python3-venv solaar tig tlp tlp-rdw tmux translate-shell tree vim virtualbox zsh
sudo apt install -y virtualbox-ext-pack
# ネットワーク接続系
# VPN
sudo apt install network-manager-openconnect-gnome
sudo systemctl daemon-reload
# https://cloudpack.media/14148 のUbuntuの手順での証明書の導入

chsh -s $(which zsh)

im-config -n fcitx
sudo -H pip3 install pynvim

sudo mkdir $HOME/repo
cd $HOME/repo

# golang
curl -L -O https://dl.google.com/go/go1.12.1.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.12.1.linux-amd64.tar.gz

# 絵文字対応のフォント突っ込む
curl -O https://github.com/miiton/Cica/releases/download/v4.1.2/Cica_v4.1.2.zip
unzip Cica-v4.1.2.zip
sudo cp Cica-*.ttf /usr/local/share/fonts
fc-list | grep Cica
## Gnome-terminalにも反映
UUID=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d \')
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ font "Cica Bold 11"
rm Cica-v4.1.2.zip Cica-*.ttf

# set keybinding in mozc with gui
# * Alt: IME ON/OFF
# set keybinding in setting
# * Ctrl+Alt+h,l: move current window

# echo "# bash"
# sudo ln -nfs $HOME/repo/dotfiles/.bashrc $HOME/.bashrc
# shopt -s expand_aliases
# source $HOME/.bashrc

echo "# zsh"
sudo ln -nfs $HOME/repo/dotfiles/.zshrc $HOME/.zshrc
sudo ln -nfs $HOME/repo/dotfiles/.zshenv $HOME/.zshenv
sudo ln -nfs $HOME/repo/dotfiles/.zpreztorc $HOME/.zpreztorc
shopt -s expand_aliases
source $HOME/.zshrc
source $HOME/.zshenv
source $HOME/.zpreztorc

sudo ln -nfs $HOME/repo/dotfiles/.tmux.conf $HOME/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf
echo "tmuxのプラグインの導入のため、<C-j>Iをtmux上で押下すること"

# Vim
sudo ln -nfs $HOME/repo/dotfiles/vim/.vimrc $HOME/.vimrc

# NeoVim
sudo mkdir -p $XDG_CONFIG_HOME/nvim
sudo ln -nfs $HOME/repo/dotfiles/vim/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
sudo ln -nfs $HOME/repo/dotfiles/vim/dein.toml $XDG_CONFIG_HOME/nvim/dein.toml

git config --global core.editor nvim
git config --global core.quotepath false
