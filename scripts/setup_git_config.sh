### Setup user details
git config --global user.name "Dan Arad"

# Don't override existing mail config
if ! git config --global user.email > /dev/null 2>&1; then
    git config --global user.email "dan1994@gmail.com"
fi

### Setup aliases
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.br branch
git config --global alias.co checkout

### Setup word colored diff
if ! which diff-highlight > /dev/null 2>&1; then
    DIFF_HIGHLIGHT_PATH=~/.local/bin/diff-highlight
    DIFF_HIGHLIGHT_URL=https://raw.githubusercontent.com/git/git/v2.13.2/contrib/diff-highlight/diff-highlight
    wget ${DIFF_HIGHLIGHT_URL} -O ${DIFF_HIGHLIGHT_PATH}
    chmod +x ${DIFF_HIGHLIGHT_PATH}
fi

git config --global pager.log "diff-highlight | less"
git config --global pager.show "diff-highlight | less"
git config --global pager.diff "diff-highlight | less"

### Extra config
git config --global pager.branch false
