# Include .bashrc if present
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# Enable programmable completion features 
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

# Enable fancy ls coloring 
if [ -x /usr/bin/dircolors ]; then
  alias ls='ls --color=auto'
fi

# Enable direnv if direnv is present
if [ -x /usr/local/bin/direnv ]; then
  eval "$(direnv hook bash)"
fi 

# Enable rbenv
eval "$(rbenv init -)"

# Refresh window size after each command
shopt -s checkwinsize 

# Append to the history file, don't overwrite it
shopt -s histappend

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

alias vi='vim'
alias la='ls -Alh'
alias l='ls -CF'
alias rm='rm -i'
alias mv='mv -i'
alias tmux='tmux -2'
alias grep='grep --line-number --color=auto --binary-files=without-match'

function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/:\1/'
}

show_virtual_env() {
  if [ -n "$VIRTUAL_ENV"  ]; then
    echo "($(basename $VIRTUAL_ENV))"
  fi
}

export RED="\[\033[0;31m\]"
export YELLOW="\[\033[0;33m\]"
export GREEN="\[\033[0;32m\]"
export NO_COLOUR="\[\033[0m\]" 
export PS1="$GREEN\u@$HOSTNAME$NO_COLOUR:\w$YELLOW\$(parse_git_branch)$NO_COLOUR\$ " 
export PS1='$(show_virtual_env)'$PS1 
export CLICOLOR=1
export LSCOLORS=exfxcxdxcxegedabagacad
export LS_OPTIONS='--color=auto'
export GREP_COLOR='1;32'
export PATH=$PATH:/usr/local/bin:.
export LC_ALL="ko_KR.UTF-8"
export LESS=' -R '
export TERM='xterm-256color' 
export HISTCONTROL=ignoreboth # Don't put duplicates in bash history 

# Enable direnv if direnv is present
if [ -x /usr/local/bin/direnv ]; then
  eval "$(direnv hook bash)"
fi 

# Enable rbenv
if [ -x $HOME/.rbenv/bin/rbenv ]; then
  eval "$(rbenv init -)"
fi

# Enable pyenv
if [ -x $HOME/.pyenv/bin/pyenv ]; then
  eval "$(pyenv init -)" 
fi
