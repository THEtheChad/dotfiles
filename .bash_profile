export PATH="${HOME}/Configs:$PATH"

for file in ~/Configs/.{profile,bashrc}; do
  if [ -r "$file" ]; then
    source "$file";
  fi
done
unset file

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -s /Users/THEtheChad/.nvm/nvm.sh ]] && . /Users/THEtheChad/.nvm/nvm.sh # This loads NVM

# Autoappended