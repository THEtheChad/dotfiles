# dotfiles

Zsh-first dotfiles, descended from [Paul Irish's dotfiles](https://github.com/paulirish/dotfiles)
and rebuilt for modern macOS. The shell setup is built on
[oh-my-zsh](https://ohmyz.sh) (history, completion, prompt, key bindings),
with topic files (`.aliases`, `.exports`, `.functions`) sourced by the
committed `.zshrc`.

## Install

```sh
git clone <this repo> && cd dotfiles
./install.sh        # symlinks dotfiles into ~, installs oh-my-zsh + plugins
brew bundle         # optional: install CLI tools
./macos.sh          # optional: apply macOS defaults (review first — they're opinions)
```

`install.sh` backs up anything it replaces to `~/.dotfiles-backup/`, installs
oh-my-zsh if missing, and clones the two plugins it doesn't bundle
(`zsh-autosuggestions`, `zsh-syntax-highlighting`).

## Layout

| File | Purpose |
|---|---|
| `.zshrc` | oh-my-zsh setup (theme, plugins) + sources the topic files |
| `.zprofile` | Homebrew `shellenv` (Apple Silicon or Intel) |
| `.aliases` / `.exports` / `.functions` | Shell topic files, sourced by `.zshrc` |
| `.functions.claude` | `wt` — run a Claude Code session in a throwaway git worktree |
| `.gitconfig` | Git defaults and aliases — no identity |
| `.gitignore_global` | Global git excludes (OS/editor junk only) |
| `.vimrc`, `.vim/` | Vim config and colorschemes |
| `.tmux.conf` | tmux: truecolor, mouse, vi copy mode, 1-based windows |
| `ssh/config` | ssh defaults (keychain, keepalive) — no hosts |
| `.ripgreprc` | ripgrep defaults (smart case, search hidden files) |
| `.curlrc` / `.wgetrc` | Follow redirects, timestamping, sane timeouts |
| `.hushlogin` | Silences the "Last login" banner |
| `install.sh` | Symlink everything into `$HOME` with backups |
| `macos.sh` | macOS `defaults` tweaks |
| `Brewfile` | CLI tools (`brew bundle`) |
| `colors.sh` | Print terminal color chart |

## Identity and machine-specific config

Nothing personal is committed. Three gitignored files hold it, seeded by
`install.sh`:

- `~/.extra` (template: `.extra.example`) — private shell config, sourced at
  the end of `.exports`. Work GitHub hosts, machine-specific PATH entries, etc.
- `~/.gitconfig.local` (template: `.gitconfig.local.example`) — git user name,
  email, and GitHub username, pulled in by `.gitconfig` via `[include]`.
- `~/.ssh/config.local` (seeded empty) — host-specific ssh entries, included
  first by `ssh/config` so they win over the committed defaults.
