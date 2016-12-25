# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

LANG="en_ZA.utf8"
LC_COLLATE="C"

# ... and ignore same sucessive entries.
HISTCONTROL=ignoreboth
#HISTIGNORE='ls:bg:fg:history'
HISTFILESIZE=1000000
HISTSIZE=1000000

export VISUAL="vim"
export EDITOR="vim"

alias p='pushd $PWD'
alias o='popd'
alias lz='ls -Shlr'
alias ll='ls -lh'
alias la='ls -A'
alias l='ls -CF'
alias lt='ls -Alhtr'
alias rm='rm -f'
alias vi=vim

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
#makes bash append to history rather than overwrite
shopt -s histappend

PROMPT_COMMAND='history -a'

# set a fancy prompt (non-color, unless we know we "want" color
export PS1="\[\033[38;5;10m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;8m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\] \W:\[$(tput sgr0)\]\[\033[38;5;5m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ] && [ -x /usr/bin/dircolors ]; then
	eval "`dircolors -b`"
	alias ls='ls --color=auto'
	alias grep='grep --color=auto'
	alias egrep='egrep --color=auto'
fi

