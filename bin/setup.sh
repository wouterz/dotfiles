#! /bin/bash

# Get source path from BASH_SOURCE if available, otherwise $0
# echo ${BASH_SOURCE[0]:-$0}
# cd to file path to ensure relative actions success
cd "$(dirname "${BASH_SOURCE[0]:-$0}")"
# Load util functions
. "utils.sh"

# Parameters
OS=$(get_os)
MYSHELL=${1:-zsh}


# Force sudo
ask_for_sudo
# if [ $EUID != 0 ]
# then
#     sudo "$0" "$@"
#     exit $?
# fi

# Install command
if [[ $OS == *"ubuntu"* ]]
then
    TMP="sudo apt-get install -y"
elif [[ $OS == *"manjaro"* ]]
then
    TMP="yes | sudo pacman -S"
else
    echo "No setup for this OS: '$OS'"
    exit 1
fi

# Packages to install
ProgramArray=("git" "vim" "curl" "wget" $MYSHELL 'python3' 'python3-pip' 'guake' 'tmux' 'docker-compose' 'fasd' 'thefuck')
for program in ${ProgramArray[*]}; do
    sh -c "$TMP $program"
done

python3 -m pip install --upgrade pip



# ./oh-my.sh $MYSHELL

# Clean up
sudo apt autoremove -y

# source updated files
source ~/.bash_profile
source ~/.zshrc