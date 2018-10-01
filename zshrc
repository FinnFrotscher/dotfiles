export ZSH=/Users/Finn/.oh-my-zsh
export DYLD_FORCE_FLAT_NAMESPACE=1
export HOME=/Users/Finn
export PATH=/Users/Finn/.nvm/versions/node/v8.9.0/bin:/Users/Finn/.pyenv/shims/python3:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Users/Finn/.rvm/bin:/Users/Finn/.rvm/bin:/Users/Finn/.vimpkg/bin
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$PATH:/Library/TeX/Distributions/Programs/texbin"
export PATH="/usr/local/sbin:$PATH"

source $ZSH/oh-my-zsh.sh
source $HOME/.bash_profile
source $HOME/.profile

#alias python=/Users/Finn/.pyenv/shims/python2
#alias pip=/Users/Finn/.pyenv/shims/pip2

alias g="git"
alias y="yarn"
alias py="python"
alias vim="nvim"
alias vi="/usr/bin/vim"
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'

# autostart tmux
if [ "$TMUX" = "" ]; then tmux; fi

autoload colors zsh/terminfo
colors


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm use 8.9.0



ZSH_THEME="agnoster"
plugins=(git thefuck osx node npm iwhois github copyfile copydir brew)

transfer() { if [ $# -eq 0 ]; then echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; }


# set prompt
precmd() { print "" }
PS1="⟩"
RPS1="%{$fg[magenta]%}%20<...<%~%<<%{$reset_color%}"


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

transfer() {
    curl --progress-bar --upload-file $1 https://transfer.sh/$(basename $1) | tee /dev/null;
}

alias transfer=transfer

