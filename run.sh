#! /bin/bash

if [ $EUID != 0 ]
then
    sudo "$0" "$@"
    exit $?
fi

OS=$(tr [A-Z] [a-z] <<< $(uname -rv))
SHELL=${1:-zsh}

cp .vimrc ~/.vimrc

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


ProgramArray=("git" "vim" "curl" "wget" $SHELL 'python3' 'python3-pip' 'guake' 'tmux')
for program in ${ProgramArray[*]}; do
    sh -c "$TMP $program"
done

python3 -m pip install --upgrade pip
python3 -m pip install thefuck

if [ $SHELL = "zsh" ]
then
    cp .zshrc ~/.zshrc
    wget -nv https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
    sh install.sh --ship-chsh
    sudo chsh -s $(which zsh)
    rm ./install.sh
elif [ $SHELL = "fish" ]
then
    sh -c 'curl -L https://get.oh-my.fish | fish'
    sudo chsh -s $(which fish)
fi

sudo apt autoremove -y