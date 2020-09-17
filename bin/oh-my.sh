#! /bin/bash


# Oh-My-Shell

pkg_exists(){
   command -v $1 >/dev/null 2>&1 || { echo >&2 "I require foo but it's not installed.  Aborting."};
}


# install oh-my-shell
if [ $SHELL = "zsh" ]
then
   cp .zshrc ~/.zshrc
   if ! pkg_exists wget
   then
      sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
   elif !pkg_exists curl
   then
      sh -c "$(wget -qO- https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh )" "" --unattended
   fi
elif [ $SHELL = "fish" ]
then
   sh -c 'curl -L https://get.oh-my.fish | fish'
fi

chsh -s $(which $SHELL)