export EDITOR="emacs -nw"

alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs-x86_64-10_9"
alias ls="ls -G"
alias cdr="cd ~/src/superfly"
alias v="cd ~/vagrant/matt-dev/ && vagrant up && vagrant ssh"
alias hstart="/usr/local/Cellar/hadoop/2.6.0/sbin/start-dfs.sh;/usr/local/Cellar/hadoop/2.7.0/sbin/start-yarn.sh"
alias hstop="/usr/local/Cellar/hadoop/2.6.0/sbin/stop-yarn.sh;/usr/local/Cellar/hadoop/2.7.0/sbin/stop-dfs.sh"

ggrep() {
    ARGS="$@"
    git ls-files | grep -v "^media" | xargs git grep $ARGS --
}

# git autcomplete
source `brew --prefix`/etc/bash_completion

# set prompt to be a colored path with git_ps1 and error code if nonzero
# TODO: make this relative
source ~/src/dotfiles/bin/git-prompt.sh
export PS1="\[$(tput setaf 5)\]\${?##0}\[$(tput setaf 7)\]\w\[$(tput setaf 3)\]\$(__git_ps1 '(%s)')\[$(tput setaf 7)\]$ \[$(tput sgr0)\]"
