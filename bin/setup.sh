#! /bin/bash

# Parameters
OS=$(tr [A-Z] [a-z] <<< $(uname -rv))
SHELL=${1:-zsh}


# vim
cp .vimrc ~/.vimrc



# Force sudo
if [ $EUID != 0 ]
then
    sudo "$0" "$@"
    exit $?
fi

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
ProgramArray=("git" "vim" "curl" "wget" $SHELL 'python3' 'python3-pip' 'guake' 'tmux' 'docker-compose' 'fasd')
for program in ${ProgramArray[*]}; do
    sh -c "$TMP $program"
done

python3 -m pip install --upgrade pip
python3 -m pip install thefuck


echo '# Start libs' >> ~/.bashrc
echo 'eval $(fasd --init auto)' >> ~/.bashrc
echo 'eval $(thefuck --alias)' >> ~/.bashrc

# Clean up
sudo apt autoremove -y

echo "Run 'source ~/.bashrc' or start a new terminal to finish the setup"