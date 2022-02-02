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
