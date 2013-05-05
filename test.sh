prompt=$1

function waypoint() {
  echo
  echo $prompt
  echo

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

waypoint "yo"