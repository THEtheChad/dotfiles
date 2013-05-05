#!/bin/bash

echo "Pulling updates from github ..."
git pull -q
echo "Updating .bash_profile ..."
rsync -aq .bash_profile ~/.bash_profile
source ~/.bash_profile
echo "Updating .gitconfig ..."
rsync -aq .gitconfig ~/.gitconfig
echo "Update complete!"
