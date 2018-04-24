export ZSH=/Users/karnold/.oh-my-zsh

ZSH_THEME="robbyrussell"


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  docker
  tmux
)
#zsh specific settings
bindkey -e

# ---------- zsh setup
# autoload -U compinit && compinit


source $ZSH/oh-my-zsh.sh

# User configuration
#
# # Enabled bash completion mode
autoload bashcompinit
bashcompinit

# ---------- Path exports
export PATH=$PATH:/usr/local/bin
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

# ----------- Environment configs
export TERM="xterm-256color"
export EDITOR="nvim"
export SHELL="/bin/zsh"

# ----------- Command alias stuff
alias vim="nvim"
alias mux="tmuxinator"
alias tma='tmux attach -t $1'
alias tl='tmux ls'

# ----------- Alias project settings
alias tidbits="cd ~/Code/Projects/tidbits"
alias todtime="cd ~/Code/Ideas/tod"


# ----------- Functions
# If the session is in the list of current tmux sessions, it is attached. Otherwise, a new session
# is created and attached with the argument as its name.
function ta() {

  # create the session if it doesn't already exist
  tmux has-session -t $1 2>/dev/null
  if [[ $? != 0 ]]; then
    tmux new-session -d -s $1
  fi

  # if a tmux session is already attached, switch to the new session; otherwise, attach the new
  # session
  if { [ "$TERM" = "screen" ] && [ -n "$TMUX" ]; } then
    tmux switch -t $1
  else
    tmux attach -t $1
  fi
}

# List all the the sessions' names.
function tln() {
  reply=( $(tmux list-sessions | cut -d: -f1) )
}

compctl -K tln ta


# ----------- Auto complete and highlighting
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# For typescript
if [ -f /Users/karnold/.tnsrc ]; then
    source /Users/karnold/.tnsrc
fi

