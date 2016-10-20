if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

function parse_git_branch () 
{
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/:\1/'
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOUR="\[\033[0m\]"

PS1="$GREEN\u@$HOSTNAME$NO_COLOUR:\w$YELLOW\$(parse_git_branch)$NO_COLOUR\$ "

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize 

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

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

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if [ -x /usr/bin/dircolors ]; then
    alias ls='ls --color=auto'
fi

alias vi='vim'
alias la='ls -Alh'
alias l='ls -CF'
alias rm='rm -i'
alias mv='mv -i'
alias tmux='tmux -2'

export CLICOLOR=1
export LSCOLORS=exfxcxdxcxegedabagacad
export LS_OPTIONS='--color=auto'
export GREP_OPTIONS='--line-number --color=auto --binary-files=without-match'
export GREP_COLOR='1;32'
export PATH=$PATH:/usr/local/bin:.
export LC_ALL="ko_KR.UTF-8"
export LESS=' -R '
export TERM='xterm-256color'
