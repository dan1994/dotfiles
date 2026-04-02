# Check if we are running in WSL
grep -q -i microsoft /proc/version
export IN_WSL=$?

# Set display correctly
if [[ $IN_WSL ]]; then
    # Since Windows 11 and wslg changing the display variable will cause problems
    if [[ ! -d /mnt/wslg ]]; then
        export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0.0
    fi
else
    export DISPLAY=:0.0
fi

# History substring search keybindings
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

export PATH=${HOME}/.local/bin:$PATH

# Common Utilities
alias ll="ls -lAhF"
_l() {
	[[ -f $1 ]] && less $1 || ll $1
}
alias l=_l

alias help=run-help
alias tmp='tempdir=$(mktemp -d); cd ${tempdir}; code .; trap "rm -rf ${tempdir}" EXIT'

alias cp='cp -g'
alias mv='mv -g'

# Git
__git_reset() {
    git reset @~${1:-1}
}

__git_reset_hard() {
    git reset --hard @~${1:-1}
}

__git_update() {
    local branch=${1:-develop}
    git co $branch
    git pull --rebase --ff-only || return 1
    git co -
    git rebase $branch
}

alias gci='git commit -m'
alias gd='git diff -w'
alias gdc='git diff -w --cached'
alias gdl='git diff -w HEAD^ HEAD'
alias gf='git fetch -p'
alias glg="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gmv='git mv'
alias gpl='git pull --rebase --ff-only'
alias gr='__git_reset'
alias grh='__git_reset_hard'
alias gup='__git_update'

# For commit messages
if [[ "$IN_WSL" ]]; then
    export EDITOR="\"$(echo $PATH | tr ':' '\n' | grep "Microsoft VS Code")/code\" --wait"
else
    export EDITOR="code --wait"
fi

# NodeJS
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Go
export PATH=/usr/local/go/bin:${PATH}
export PATH=$(go env GOPATH):${PATH}

# Python
alias python=python3

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if which pyenv > /dev/null; then
    eval "$(pyenv init - zsh)"
    eval "$(pyenv virtualenv-init -)"
fi
