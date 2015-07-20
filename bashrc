export EDITOR="emacs -nw"

alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs-x86_64-10_9"
alias ls="ls -G"
alias cdr="cd ~/src/superfly"
alias v="cd ~/vagrant/matt-dev/ && vagrant up && vagrant ssh"
alias hstart="/usr/local/Cellar/hadoop/2.6.0/sbin/start-dfs.sh;/usr/local/Cellar/hadoop/2.7.0/sbin/start-yarn.sh"
alias hstop="/usr/local/Cellar/hadoop/2.6.0/sbin/stop-yarn.sh;/usr/local/Cellar/hadoop/2.7.0/sbin/stop-dfs.sh"


# git autcomplete
source `brew --prefix`/etc/bash_completion

# set prompt to be a colored path with git_ps1 and error code if nonzero
# TODO: make this relative
source ~/src/dotfiles/bin/git-prompt.sh
export PS1="\e[0;35m\${?##0}\e[0;90m\w\e[m\e[0;34m\$(__git_ps1 '(%s)')\e[0;90m$\e[m "
