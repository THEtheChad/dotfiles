#!/usr/bin/env bash
# Symlink dotfiles into $HOME, backing up anything that would be overwritten.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

FILES=(.aliases .exports .functions .gitconfig .gitignore_global .vimrc .vim)

for name in "${FILES[@]}"; do
  src="$DOTFILES/$name"
  dest="$HOME/$name"
  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    mkdir -p "$BACKUP"
    mv "$dest" "$BACKUP/"
    echo "backed up $dest -> $BACKUP/$name"
  fi
  ln -sfn "$src" "$dest"
  echo "linked   $dest -> $src"
done

# Seed private files (gitignored, never committed) from their templates
[ -f "$HOME/.extra" ] || { cp "$DOTFILES/.extra.example" "$HOME/.extra"; echo "created  ~/.extra (fill in)"; }
[ -f "$HOME/.gitconfig.local" ] || { cp "$DOTFILES/.gitconfig.local.example" "$HOME/.gitconfig.local"; echo "created  ~/.gitconfig.local (fill in)"; }

echo
echo "Done. Fill in ~/.extra and ~/.gitconfig.local with identity/machine-specific config."
echo "If ~/.gitconfig was backed up above, migrate anything you still need into ~/.gitconfig.local."
echo "Optional: ./macos.sh for macOS defaults, 'brew bundle' for packages."
