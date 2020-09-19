#!/bin/bash

# Requrement - ubuntu or majaro
OS="$(. /etc/os-release; printf "%s" "$ID")"
echo "Detected operating system: $OS"
# Check if the OS is Ubuntu
if [ "$OS" != "ubuntu" -a "$OS" != "manjaro" ]; then
    echo "Sorry, this script is intended only for Ubuntu or Manjaro!\n"
    exit
fi

##### Start Script #####

declare -r GITHUB_REPOSITORY="wouterz/dotfiles"
declare -r DOTFILES_UTILS_URL="https://raw.githubusercontent.com/$GITHUB_REPOSITORY/master/bin/utils.sh"

# Helper function
download() {
    echo "Attempting to download: $1 to $2"
    local url="$1"
    local output="$2"

    if [ -x "$(command -v curl)" ]; then

        curl -LsSo "$output" "$url" &> /dev/null
        #     │││└─ write output to file
        #     ││└─ show error messages
        #     │└─ don't show the progress meter
        #     └─ follow redirects

    elif [ -x "$(command -v wget)" ]; then

        wget -qO "$output" "$url" &> /dev/null
        #     │└─ write output to file
        #     └─ don't show output

    else
        return 1
    fi

    return $?

}

# Relative path to script
SCRIPTPATH="$(dirname "${BASH_SOURCE[0]:-$0}")"

# Require utils
UTILS_FILE="$SCRIPTPATH/bin/utils.sh"
if [ -f "$UTILS_FILE" ]; then
    . "$UTILS_FILE"
else
    echo "cant find utils at: $UTILS_FILE."
    tmpFile="$(mktemp -u XXXXXXXX)"
    download "$DOTFILES_UTILS_URL" "/tmp/$tmpFile"  && . "/tmp/$tmpFile" || exit
fi

ask_for_sudo

# TODO set flags and gather answers and execute all at the end

ask_for_confirmation "Install dev packages??" 
if answer_is_yes; then
    echo "Do something X"
    # . "$SCRIPTPATH/bin/pkgs.sh"
fi

ask_for_confirmation "Install (oh-my)-shell?" 
if answer_is_yes; then
    ask "(zsh|fish)"
    # . "$SCRIPTPATH/bin/oh-my.sh" $REPLY
fi

ask_for_confirmation "Switch CAPS and F12 key?" 
if answer_is_yes; then
    echo "Switching keys"
    # . "$SCRIPTPATH/bin/switch-keys.sh"
fi

ask_for_confirmation "Install VSCode extensions?" 
if answer_is_yes; then
    echo "Switching keys"
    # . "$SCRIPTPATH/bin/code-setup.sh"
fi