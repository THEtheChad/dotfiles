# APPLICATION SHORTCUTS
alias sublime='open -a Sublime'
alias chrome='open -a Google\ Chrome'

# SETTINGS
# defaults write com.apple.finder AppleShowAllFiles TRUE

# CUSTOM PROMPT
export PS1='\[\033[33m\]\h\n\$\[\033[0m\] '
export PATH=$PATH:~/Configs/bin

# BOILER PLATES
alias html='echo "Project name:"; read name; cp -r ~/Configs/boiler_html ~/Desktop/$name; cd ~/Desktop/$name; sublime .'
alias html5='echo "Project name:"; read name; cp -r ~/Configs/boiler_html5 ~/Desktop/$name; cd ~/Desktop/$name; sublime .'
alias wordpress='echo "Project name:"; read name; cp -r ~/Configs/roots ~/Sites/wordpress/wp-content/themes/$name; cd ~/Sites/wordpress/wp-content/themes/$name; sublime .'

# HAPPY FUN TIMES
alias saver='/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine -background'

# ALLOWS TIMING APPLICATION TO TRACK TERMINAL USAGE
PROMPT_TITLE='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'
export PROMPT_COMMAND="${PROMPT_COMMAND} ${PROMPT_TITLE}; "
