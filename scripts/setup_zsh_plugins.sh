install_plugin() {
    local plugin_install_dir=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/$1
    local plugin_repo=$2
    if [[ ! -d $plugin_install_dir ]]; then
        git clone $plugin_repo $plugin_install_dir
    fi
}

install_plugin zsh-autosuggestions https://github.com/zsh-users/zsh-autosuggestions
install_plugin zsh-syntax-highlighting https://github.com/zsh-users/zsh-syntax-highlighting.git
install_plugin zsh-history-substring-search https://github.com/zsh-users/zsh-history-substring-search
