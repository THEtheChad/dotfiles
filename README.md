# dotfiles

Zsh-first dotfiles, descended from [Paul Irish's dotfiles](https://github.com/paulirish/dotfiles)
and rebuilt for modern macOS. Topic files (`.aliases`, `.exports`, `.functions`)
are meant to be sourced from `.zshrc`:

```sh
for file in ~/.{exports,aliases,functions}; do
  [ -r "$file" ] && source "$file"
done
unset file
```

## Install

```sh
git clone <this repo> && cd dotfiles
./install.sh        # symlinks dotfiles into ~, backing up anything it replaces
brew bundle         # optional: install CLI tools
./macos.sh          # optional: apply macOS defaults (review first — they're opinions)
```

## Layout

| File | Purpose |
|---|---|
| `.aliases` / `.exports` / `.functions` | Shell topic files, sourced by `.zshrc` |
| `.gitconfig` | Git defaults and aliases — no identity |
| `.gitignore_global` | Global git excludes (OS/editor junk only) |
| `.vimrc`, `.vim/` | Vim config and colorschemes |
| `install.sh` | Symlink everything into `$HOME` with backups |
| `macos.sh` | macOS `defaults` tweaks |
| `Brewfile` | CLI tools (`brew bundle`) |
| `colors.sh` | Print terminal color chart |

## Identity and machine-specific config

Nothing personal is committed. Two gitignored files hold it, seeded from
templates by `install.sh`:

- `~/.extra` (template: `.extra.example`) — private shell config, sourced at
  the end of `.exports`. Work GitHub hosts, machine-specific PATH entries, etc.
- `~/.gitconfig.local` (template: `.gitconfig.local.example`) — git user name,
  email, and GitHub username, pulled in by `.gitconfig` via `[include]`.
