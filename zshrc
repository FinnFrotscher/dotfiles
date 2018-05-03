export ZSH=/Users/Finn/.oh-my-zsh
export DYLD_FORCE_FLAT_NAMESPACE=1
ZSH_THEME="agnoster"
plugins=(git thefuck osx node npm iwhois github copyfile copydir brew)

source $ZSH/oh-my-zsh.sh
export HOME=/Users/Finn

source $HOME/.bash_profile
source $HOME/.profile

alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


transfer() { if [ $# -eq 0 ]; then echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; }

export PATH=/Users/Finn/.nvm/versions/node/v6.11.1/bin:/Users/Finn/anaconda3/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Users/Finn/.rvm/bin:/Users/Finn/.rvm/bin:/Users/Finn/.vimpkg/bin

export PATH="$PATH:/Library/TeX/Distributions/Programs/texbin"

autoload colors zsh/terminfo
colors

# set prompt
precmd() { print "" }
PS1="⟩"
RPS1="%{$fg[magenta]%}%20<...<%~%<<%{$reset_color%}"

# autostart tmux
if [ "$TMUX" = "" ]; then tmux; fi

# autocorrect
setopt correctall
alias git status='nocorrect git status'


# antigen
source $(brew --prefix)/share/antigen/antigen.zsh

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle git


#pyenv
eval "$(pyenv init -)" 
eval "$(pyenv virtualenv-init -)"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
