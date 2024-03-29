#!/bin/bash -

set -o nounset                              # Treat unset variables as an error
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

rsync -avzr \
    --exclude 'README.md' --exclude '.git' --exclude 'install.sh' --exclude '*.swp' --exclude '*.txt' \
    --include '.*' \
    ${DIR}/ ~/

sudo apt-get install -y xmonad xmobar dmenu git shellcheck fish fzf fd-find kitty nvim

# install i3lock-fancy
git clone https://github.com/meskarune/i3lock-fancy.git
cd i3lock-fancy
sudo make install

# install pyenv
curl https://pyenv.run | bash

# Install Nvim
mkdir -p ~/build
pushd ~/build
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
sudo apt install ./nvim-linux64.deb
popd

sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/nvim 100
sudo update-alternatives --set editor /usr/local/bin/vim

# coc.nvim stuff
# install nodejs
curl -sL install-node.vercel.app/lts | sudo bash
# vim plug is nice, moving to it methinks
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/.config/nvim/
ln -s ~/.vim/vimrc ~/.config/nvim/init.vim
