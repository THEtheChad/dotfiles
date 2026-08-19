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

## wt

Each `wt` worktree owns a Claude Code session. `wt` mints the session id itself
and passes it to `claude --session-id`, so the id is stable and `wt resume`
lands back in the same conversation. It is stored in worktree-scoped git config
(`wt.sessionId`), which keeps it out of `git status`.

Every operation takes an explicit command — there is no bare `wt`.

```
wt list                worktrees with session id, status, description
wt new [branch]        create worktree + session, launch claude
wt resume <ref>        cd back into a worktree, resume its session
wt rm <ref>            remove worktree and delete its branch
wt help
```

`<ref>` is a session-id prefix (like a short sha), a branch name, or a worktree
directory name. With no branch, `wt new` picks the next free `wt/N`. Args after
`new`/`resume` pass through to `claude`.

```
$ wt list
  SESSION   BRANCH          PATH                            DESCRIPTION
            main            ~/Projects/dotfiles             (main worktree)
* 4f21a8c3  wt/1            ~/Projects/dotfiles-wt-1        rework wt list with session ids
  b5fb2fdf  feature/x       ~/Projects/dotfiles-feature-x   add the ingress shim

$ wt resume 4f21
```

`*` marks a busy session, `.` an idle or waiting one — read from
`~/.claude/sessions/`, so only live sessions are marked. Descriptions are the
session's first real prompt, read from `~/.claude/history.jsonl`; Claude Code
does not store a summary anywhere, so that is the best available label.

| Env | Effect |
|---|---|
| `WT_SAFE=1` | launch with permission prompts enabled |
| `WT_NO_LAUNCH=1` | set up the worktree and `cd` there, don't launch |
| `WT_DIR=<path>` | where worktrees live (default: sibling of repo root) |

## Layout

| File | Purpose |
|---|---|
| `.zshrc` | oh-my-zsh setup (theme, plugins) + sources the topic files |
| `.zprofile` | Homebrew `shellenv` (Apple Silicon or Intel) |
| `.aliases` / `.exports` / `.functions` | Shell topic files, sourced by `.zshrc` |
| `.functions.claude` | `wt` — run Claude Code sessions in throwaway git worktrees ([below](#wt)) |
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
