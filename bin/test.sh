#! /bin/bash


# function is_ubuntu() {
#   [[ "$(cat /etc/issue 2> /dev/null)" =~ Ubuntu ]] || return 1 ;
# }

# function link_home() {
#     # -sf force after backup?
#     ln -s $(dirname $SCRIPTPATH)/$1 ~/$1;
# }



pkg_require wget

pkg_exists fetch

pkg_require fetch

pkg_require fetch


# link dotfiles
# link_home .vimrc
# link_home .bashrc
# link_home .zshrc
# link_home .gitconfig

# echo '# Start libs' >> ~/.bashrc
# echo 'eval $(fasd --init auto)' >> ~/.bashrc
# echo 'eval $(thefuck --alias)' >> ~/.bashrc