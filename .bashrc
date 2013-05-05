for file in ~/Configs/.{prompt,exports,aliases,functions}; do
  [ -r "$file" ] && source "$file"
done
unset file

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# CUSTOM PROMPT
# export PS1='\[\033[33m\]\h\n\$\[\033[0m\] '

# SETTINGS
# defaults write com.apple.finder AppleShowAllFiles TRUE

# ALLOWS TIMING APPLICATION TO TRACK TERMINAL USAGE
# PROMPT_TITLE='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'
# export PROMPT_COMMAND="${PROMPT_COMMAND} ${PROMPT_TITLE}; "
# [[ -s /Users/THEtheChad/.nvm/nvm.sh ]] && . /Users/THEtheChad/.nvm/nvm.sh # This loads NVM