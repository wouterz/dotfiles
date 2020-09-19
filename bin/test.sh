#! /bin/bash


# function is_ubuntu() {
#   [[ "$(cat /etc/issue 2> /dev/null)" =~ Ubuntu ]] || return 1 ;
# }

# function link_home() {
#     # -sf force after backup?
#     ln -s $(dirname $SCRIPTPATH)/$1 ~/$1;
# }


# cd "$(dirname "${BASH_SOURCE[0]}")"


# Get source path from BASH_SOURCE if available, otherwise $0
echo ${BASH_SOURCE[0]:-$0}

# cd to file path to ensure relative actions success
cd "$(dirname "${BASH_SOURCE[0]:-$0}")"


. "utils.sh"


print_success "before"


# . "oh-my.sh" "zsh"
# link_home .zshrc

# ask "Do this now?"

ask_for_confirmation "link dotfiles??" 
if answer_is_yes; then
    echo ""
    print_in_green "Linking dotfiles\n"
    # link dotfiles
    # link_home .vimrc
    # link_home .bashrc
    # link_home .zshrc
    # link_home .gitconfig

    # . "symlinks.sh"

fi

print_warning 'after'

# pkg_require wget

# pkg_exists fetch

# pkg_require fetch
# pkg_require fetch



# echo '# Start libs' >> ~/.bashrc
# echo 'eval $(fasd --init auto)' >> ~/.bashrc
# echo 'eval $(thefuck --alias)' >> ~/.bashrc