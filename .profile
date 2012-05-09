clear

# FAVORITES
alias lunchup='cd ~/Sites/lunchup;open -a Sublime .;open .'

# APPLICATION SHORTCUTS
alias sublime='open -a Sublime'
alias chrome='open -a Google\ Chrome'

# SETTINGS
# defaults write com.apple.finder AppleShowAllFiles TRUE

# CUSTOM PROMPT
export PS1='\[\033[33m\]\h\n\$\[\033[0m\] '
export PATH=$PATH:~/Configs/bin

# BOILER PLATES
alias html='echo "Project name:"; read name; cp -r ~/Configs/boiler_html ~/Desktop/$name; sublime ~/Desktop/$name'
alias html5='echo "Project name:"; read name; cp -r ~/Configs/boiler_html5 ~/Desktop/$name; sublime ~/Desktop/$name'

# HAPPY FUN TIMES
alias saver='/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine -background'

# ALLOWS TIMING APPLICATION TO TRACK TERMINAL USAGE
PROMPT_TITLE='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'
export PROMPT_COMMAND="${PROMPT_COMMAND} ${PROMPT_TITLE}; "