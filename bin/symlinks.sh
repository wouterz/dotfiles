#! /bin/bash


. "utils.sh"

# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
SCRIPTPATH=$(dirname "$SCRIPT")

function link_home() {
    ln -sf $(dirname $SCRIPTPATH)/$1 ~/$1;
}

# link dotfiles
link_home .vimrc

link_home .bashrc
link_home .bash_profile

link_home .zshrc

link_home .aliases

link_home .gitconfig
link_home .gitattributes_global
link_home .gitignore_global

link_home .tmux.conf

