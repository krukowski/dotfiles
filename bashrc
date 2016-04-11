export EDITOR="emacs -nw"

alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs-x86_64-10_9"
alias ls="ls -G"
alias cdr="cd ~/src/firewater"
alias v="cd ~/vagrant/matt-dev/ && vagrant up && vagrant ssh"
alias grep='grep --color=auto'

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

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
