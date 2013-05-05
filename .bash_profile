export PATH="${HOME}/Configs:$PATH"

for file in ~/Configs/.{profile,bashrc}; do
  if [ -r "$file" ]; then
    source "$file";
  fi
done
unset file

# Autoappended