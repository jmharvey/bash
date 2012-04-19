# prompt & title
function parse_git_branch_and_add_brackets {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \[\1\]/'
}

export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;37m\][\t]\[\033[00m\]\n\[\033[01;31m\]\u@\h\[\033[00m\]\n\[\033[01;37m\]\w \[\033[01;34m\]\n[\#]$(parse_git_branch_and_add_brackets) \$\[\033[00m\] '
export PROMPT_COMMAND='echo -ne "\033]0;   $USER@$HOSTNAME    [${PWD/$HOME/~}]\007"'

export PATH="~/scripts:$PATH"
export LD_LIBRARY_PATH="/usr/local/lib:$LD_LIBRARY_PATH"

alias q='exit'

# grep family
alias grep='grep --color=auto'

alias .b='source ~/.bashrc'
alias h='history'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias eg='env | grep \!*'
alias psg='ps aux| grep \!*'


# ls family
alias ls='ls --color=auto'
alias lf='ls -F'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls -ltr'

# program aliasas
alias eclipse='~/scripts/run_eclipse.sh &'
alias ssh='ssh -o ServerAliveInterval=300'
alias vim='/usr/local/bin/vim --servername server'

# use vi commands in terminal
set -o vi
# ^p check for partial match in history
bind -m vi-insert "\C-p":dynamic-complete-history
# ^n cycle through the list of partial matches
bind -m vi-insert "\C-n":menu-complete
# ^l clear screen
bind -m vi-insert "\C-l":clear-screen

# make etc
function build {
    ~/scripts/build.sh $@
}
