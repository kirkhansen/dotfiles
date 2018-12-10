#!/bin/bash - 
#===============================================================================
#
#          FILE: install.sh
# 
#         USAGE: ./install.sh 
# 
#   DESCRIPTION: Copies files to users home, and attempts to install some packages
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 09/17/2018 13:36
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

rsync -avzr \
    --exclude 'README.md' --exclude '.git' --exclude 'install.sh' --exclude '*.swp' --exclude '*.txt' \
    --include '.*' \
    ${DIR}/ ~/

sudo apt install terminator xmonad xmobar dmenu xtrlock git shellcheck

while read repo; do
    git -C ~/.vim/bundle/ clone "$repo"
done < vim-packages.txt

git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
