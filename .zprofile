# Homebrew — Apple Silicon or Intel install locations
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# JetBrains Toolbox CLI launchers (idea, webstorm, …). Appended, not
# prepended — these should never win over a project-local toolchain.
jetbrains_scripts="$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
[ -d "$jetbrains_scripts" ] && export PATH="$PATH:$jetbrains_scripts"
unset jetbrains_scripts

# ~/.local/bin and ~/.claude/bin are handled by ~/.zshenv, which runs first
# and guards against double-prepending — deliberately not repeated here.
