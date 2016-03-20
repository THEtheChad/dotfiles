export PATH="${HOME}/dotfiles:$PATH"

for file in ~/dotfiles/.{profile,bashrc}; do
  if [ -r "$file" ]; then
    source "$file";
  fi
done
unset file

# Autoappended
