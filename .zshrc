
###-tns-completion-start-###
if [ -f /Users/karnold/.tnsrc ]; then
    source /Users/karnold/.tnsrc
fi
###-tns-completion-end-###
TERM=xterm-256color

plugins=(
  git
  osx
  docker
  tmux
  web-search
)

ZSH_THEME=""
autoload -U compinit && compinit

#tmux settings
source ~/.config/completions/tmuxinator.zsh

#Path exports
export PATH=$PATH:/Users/karnold/Library/Python/3.6/bin
export PATH=$PATH:~/Tools/flutter/bin
export ANDROID_HOME=/usr/local/Caskroom/android-sdk/3859397,26.0.1
export JAVA_HOME=/Library/Java/Home
export GOPATH=$HOME/Go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH="$HOME/.cargo/bin:$PATH"

#Environment configs
export EDITOR="nvim"
export SHELL="/bin/zsh"


#Command alias stuff
alias vim="nvim"
alias mux="tmuxinator"

#Alias project settings
alias tidbits="cd ~/Code/Projects/tidbits"
alias todtime="cd ~/Code/Ideas/tod"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#zsh specific settings
bindkey -e

