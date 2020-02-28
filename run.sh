#! /bin/bash

cp .vimrc ~/.vimrc
cp .zshrc ~/.zshrc

OS=$(uname -o)
if [ $OS = "GNU/Linux" ]
then
    TMP="sudo apt-get install -y"
else
    echo "No setup for this OS: '$OS'"
    exit 1
fi

SHELL=${1:-zsh}

ProgramArray=("git" "vim" "curl" $SHELL 'python3' 'python3-pip' 'guake' 'tmux')
for program in ${ProgramArray[*]}; do
    echo $program
    sh -c "$TMP $program"
done

python3 -m pip install --upgrade pip
python3 -m pip install thefuck

if [ $SHELL = "zsh" ]
then
    sudo apt install -y zsh
    wget -nv https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
    sh install.sh --ship-chsh
    sudo chsh -s $(which zsh)
    rm ./install.sh
fi


sudo apt autoremove -y

