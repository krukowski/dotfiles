export EDITOR="emacs -nw"

alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs-x86_64-10_9"
alias ls="ls -G"
alias cdr="cd ~/src/superfly"
alias v="cd ~/vagrant/matt-dev/ && vagrant up && vagrant ssh"

# git autcomplete
source `brew --prefix`/etc/bash_completion

# set prompt to be a colored path with git_ps1 and error code if nonzero
source ~/.git-prompt.sh
export PS1="\e[0;35m\${?##0}\e[0;90m\w\e[m\e[0;34m\$(__git_ps1 '(%s)')\e[0;90m$\e[m "