#!/bin/bash

bash sync.sh

prompt=$1

function waypoint() {
  if [ "$prompt" == "-q" ]; then
    return;
  fi

  echo;
  echo "Would you like to install $1? (y/n)"
  read -p "$ " -n 1
  echo;

  if [[ $REPLY =~ ^[Nn]$ ]]; then
    return 1
  fi
}


if waypoint "Z"; then
  # https://github.com/rupa/z
  # z, oh how i love you
  mkdir -p code/z
  curl https://raw.github.com/rupa/z/master/z.sh > code/z/z.sh
  chmod +x code/z/z.sh
  # also consider moving over your current .z file if possible. it's painful to rebuild :)
fi


if waypoint "Homebrew"; then
  # homebrew!
  echo "Make sure the CLI tools for xCode are installed."
  echo "Are you ready to continue? (y/n)"
  read -p "$ " -n 1
  echo
  
  if [[ $REPLY =~ ^[Nn]$ ]]; then
    exit 1
  fi

  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" && brew doctor
fi

# jq
# brew install jq

# ngrep
# brew install ngrep


# Update mac config
if waypoint "Mac defaults"; then
	source .osx
fi
