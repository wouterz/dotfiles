#! /bin/bash

# Parameters
OS=$(tr [A-Z] [a-z] <<< $(uname -rv))
SHELL=${1:-zsh}


# Require and exit if not exists
function pkg_require(){
   command -v $1 >/dev/null 2>&1 || { echo >&2 "I require $1 but it's not installed.  Aborting." ; exit 1; } 
}

# Check if exists
function pkg_exists() {
       command -v $1 >/dev/null 2>&1 || echo >&2 "Pkg $1 is not installed." 
}




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




# Clean up
sudo apt autoremove -y

source ~/.bash_profile;
