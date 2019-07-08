export EDITOR="/Applications/Emacs.app/Contents/MacOS/Emacs-x86_64-10_9 -nw"
export PYTHONIOENCODING=UTF-8
export LESS=Ri
# export VAGRANT_SERVER_URL="https://vagrantcloud.com"

alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs-x86_64-10_9"
alias ls="ls -G"
alias cdr="cd ~/src/firewater"
alias cdp="cd ~/src/parcel"
alias cdvp="cd ~/src/parcel/app/models/parsers/products/vendors"
alias cds="cd ~/src/sfcore"
alias cdsf="cd ~/src/sevenfifty"
alias cdd="cd ~/src/distiller"
alias cdb="cd ~/src/beacon"
alias cdbx="cd ~/src/boxes"
alias cdo="cd ~/src/backlog"
alias v="ssh v"
alias grep='grep --color=auto -I'
alias free="top -l 1 -s 0 | grep PhysMem | sed 's/, /\'$'\n         /g'"
alias rtest="ruby -Itest"
alias logger="ssh -D 56789 logger.sevenfifty.com"
alias gin="ssh deploy@gin"
alias prdb="psql $PROD_DATABASE_URL"
alias logdb="psql $PROD_LOG_DATABASE_URL"

shopt -s -o ignoreeof

ggrep() {
    ARGS="$@"
    git ls-files | grep -v "^assets" | grep -v "^app/assets" | xargs git grep $ARGS --
}

csvless() {
    csvlook $@ | less -S
}

# git autcomplete
source `brew --prefix`/etc/bash_completion

# set prompt to be a colored path with git_ps1 and error code if nonzero
# TODO: make this relative
source ~/src/dotfiles/bin/git-prompt.sh
export PS1="\[$(tput setaf 5)\]\${?##0}\[$(tput setaf 7)\]\w\[$(tput setaf 3)\]\$(__git_ps1 '(%s)')\[$(tput setaf 7)\]$ \[$(tput sgr0)\]"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -s "$HOME/.bash_secrets" ]] && source "$HOME/.bash_secrets" # API keys and secrets not checked into git
