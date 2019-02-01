# CapsLock to Ctrl
echo 'XKBOPTIONS="ctrl:nocaps"' | sudo tee -a /etc/default/keyboard &> /dev/null
# translate directory names in $HOME in English
LANG=C xdg-user-dirs-update --force

# install
sudo add-apt-repository ppa:neovim-ppa/stable -y
sudo apt update
sudo apt install -y curl

curl -L -O https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_18.04/ /' > /etc/apt/sources.list.d/home:manuelschneid3r.list"
sudo apt-get update
sudo apt install -y albert

sudo apt update
sudo apt install -y asunder chrome-gnome-shell clamav-base clamav-freshclam dkms exfat-fuse exfat-utils fcitx-mozc ffmpeg fonts-ricty-diminished gimp git gnome-shell gnome-sushi gnome-tweak-tool gnome-tweaks golang gparted gucharmahp imagemagick jq neovim nodejs octave python3 python3-pip python3-venv solaar tig tlp tlp-rdw tmux translate-shell tree vim virtualbox zsh

# ネットワーク接続系
# VPN
sudo apt install network-manager-openconnect-gnome
sudo systemctl daemon-reload
# https://cloudpack.media/14148 のUbuntuの手順での証明書の導入

chsh -s $(where zsh)

im-config -n fcitx
sudo -H pip3 install pynvim

mkdir $HOME/repo && cd $HOME/repo
cd $HOME/repo
git clone https://github.com/LAKuEN/dotfiles.git
shopt -s expand_aliases

source setup.sh

# set keybinding in mozc with gui
# * Alt: IME ON/OFF
# * Ctrl+Alt+h,l: move current window
