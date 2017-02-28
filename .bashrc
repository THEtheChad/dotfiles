for file in ~/dotfiles/.{prompt,exports,aliases,functions}; do
  [ -r "$file" ] && source "$file"
done
unset file

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

[[ -s "$HOME/.nvm/nvm.sh" ]] && source "$HOME/.nvm/nvm.sh"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -x "$HOME/dotfiles/code/z/z.sh" ]] && source "$HOME/dotfiles/code/z/z.sh"

export PATH="/usr/local/bin:$PATH"