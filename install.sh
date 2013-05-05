#!/bin/bash

prompt=$1

function waypoint() {
  if [ "$prompt" == "-q" ]; then
    return;
  fi

  echo
  echo -e "\033[1;34;47m  $1 installation has completed!  \033[m"
  echo "Would you like to continue the installation process? (y/n)"
  read -p "$ " -n 1
  echo

  if [[ $REPLY =~ ^[Nn]$ ]]; then
    exit 1
  fi
}



# homebrew!
# you need the code CLI tools YOU FOOL.
echo "Make sure the CLI tools for xCode are installed."
echo "Are you ready to continue? (y/n)"
read -p "$ " -n 1
echo

if [[ $REPLY =~ ^[Nn]$ ]]; then
  exit 1
fi

ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)" && brew doctor

waypoint "Homebrew"



# https://rvm.io
# rvm for the rubiess
curl -L https://get.rvm.io | bash -s stable --ruby

waypoint "RVM"



# https://github.com/creationix/nvm
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

waypoint "NVM"