#!/usr/bin/env bash
# Symlink dotfiles into $HOME, backing up anything that would be overwritten.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

FILES=(.zshrc .zprofile .aliases .exports .functions .functions.claude
       .gitconfig .gitignore_global
       .vimrc .vim .tmux.conf .ripgreprc .curlrc .wgetrc .hushlogin)

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

# ~/.ssh/config — handled separately so we never touch keys, and the
# directory keeps its required permissions
mkdir -p "$HOME/.ssh"
chmod 700 "$HOME/.ssh"
if [ -e "$HOME/.ssh/config" ] && [ ! -L "$HOME/.ssh/config" ]; then
  mkdir -p "$BACKUP"
  mv "$HOME/.ssh/config" "$BACKUP/ssh-config"
  echo "backed up ~/.ssh/config -> $BACKUP/ssh-config"
fi
ln -sfn "$DOTFILES/ssh/config" "$HOME/.ssh/config"
echo "linked   $HOME/.ssh/config -> $DOTFILES/ssh/config"
touch "$HOME/.ssh/config.local"

# oh-my-zsh (required by .zshrc). RUNZSH/KEEP_ZSHRC keep the installer from
# launching a shell or moving our symlinked .zshrc aside.
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "installing oh-my-zsh..."
  RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Third-party zsh plugins not bundled with oh-my-zsh
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
for plugin in zsh-autosuggestions zsh-syntax-highlighting; do
  if [ ! -d "$ZSH_CUSTOM/plugins/$plugin" ]; then
    git clone --depth=1 "https://github.com/zsh-users/$plugin" "$ZSH_CUSTOM/plugins/$plugin"
  fi
done

# Seed private files (gitignored, never committed) from their templates
[ -f "$HOME/.extra" ] || { cp "$DOTFILES/.extra.example" "$HOME/.extra"; echo "created  ~/.extra (fill in)"; }
[ -f "$HOME/.gitconfig.local" ] || { cp "$DOTFILES/.gitconfig.local.example" "$HOME/.gitconfig.local"; echo "created  ~/.gitconfig.local (fill in)"; }

echo
echo "Done. Fill in ~/.extra and ~/.gitconfig.local with identity/machine-specific config."
echo "Host-specific ssh entries go in ~/.ssh/config.local."
echo "If ~/.gitconfig was backed up above, migrate anything you still need into ~/.gitconfig.local."
echo "Optional: ./macos.sh for macOS defaults, 'brew bundle' for packages."
