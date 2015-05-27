export EDITOR="emacs -nw"

alias ls="ls -G"

# git autcomplete
source `brew --prefix`/etc/bash_completion
source ~/.git-prompt.sh

# set prompt to be a short-hand path with git_ps1
export PS1='\e[0;90m\w\e[m\e[0;34m`__git_ps1 "(%s)"`\e[m\e[0;90m$\e[m '
