# fnm — node version manager. Before oh-my-zsh so the shimmed node is on PATH
# for anything the prompt or plugins shell out to. --use-on-cd switches
# versions from .node-version / .nvmrc as you move around.
eval "$(fnm env --use-on-cd --shell zsh)"

# oh-my-zsh — provides history defaults, completion, prompt, and key bindings.
# Installed by install.sh if missing.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# zsh-autosuggestions and zsh-syntax-highlighting are third-party plugins,
# cloned into $ZSH_CUSTOM/plugins by install.sh. syntax-highlighting must
# be the last plugin loaded. fzf and zoxide are bundled with oh-my-zsh but
# need the binaries from the Brewfile.
plugins=(
  git
  fzf
  zoxide
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source "$ZSH/oh-my-zsh.sh"

# oh-my-zsh aliases `md` to `mkdir -p`, which would shadow the md function
# in .functions (mkdir + cd). Drop the alias so the function wins.
unalias md 2>/dev/null

# Topic files: exports first, then aliases and functions. Tool-specific
# function packs are suffixed (.functions.claude) so they stay separable.
for file in ~/.{exports,aliases,functions,functions.claude}; do
  [ -r "$file" ] && source "$file"
done
unset file

# iTerm2 shell integration, plus per-directory badges read from ~/.badges
# (machine-local, not part of this repo — format: "<path prefix> <badge>").
if [ -r "$HOME/.iterm2_shell_integration.zsh" ]; then
  source "$HOME/.iterm2_shell_integration.zsh"

  dir_badges() {
    [ -r "$HOME/.badges" ] || return 0
    while read directory badge || [[ -n "$directory" ]]; do
      if [[ "$PWD" == $directory* ]]; then
        echo $badge
        break
      fi
    done < "$HOME/.badges"
  }

  iterm2_print_user_vars() {
    iterm2_set_user_var badge $(dir_badges)
  }
fi
