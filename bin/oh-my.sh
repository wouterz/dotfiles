#! /bin/bash

# Load util functions
. "utils.sh"

echo "install oh-my-$1"

# remove sudo
sudo -k

# install oh-my-shell
if [ $1 = "zsh" ]
then
   if pkg_exists curl; then
      sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
   elif pkg_exists wget; then
      sh -c "$(wget -qO- https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh )" "" --unattended
   fi
# elif [ $1 = "fish" ]; then
#    if pkg_exists curl; then
#       sh -c "curl -L https://get.oh-my.fish | fish"
fi

chsh -s $(which $1);