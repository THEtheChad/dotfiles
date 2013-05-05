export PATH="${HOME}/Configs:$PATH"

for file in ~/Configs/.{profile,bashrc}; do
  if [ -r "$file" ]; then
    temp=$file
    source "$file";
    echo "SUCCESS: $temp";
  else
    echo "  ERROR: $file";
  fi
done
unset file