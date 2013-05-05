#!/bin/bash

echo "This will overwrite your existing .bash_profile."
read -p "Are you sure you want to continue? (y/n) " -n 1
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  cp .bash_profile ~/.bash_profile
  source ~/.bash_profile
fi