# Install zsh
if ! which zsh > /dev/null 2>&1; then
    sudo apt install zsh || exit 1
    chsh -s $(which zsh)
fi

# Install .oh-my-zsh
if zsh -c '[[ ! -d ${ZSH} ]]'; then
    sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
