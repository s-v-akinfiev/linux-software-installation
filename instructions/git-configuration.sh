get_title() {
    echo "Git configuration"
}

is_installed() {
    [[ -f ~/.gitignore ]] && grep -q "idea" ~/.gitignore
}

run() {
    echo '.idea' > ~/.gitignore
    git config --global core.excludesfile ~/.gitignore
}

