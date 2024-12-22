get_title() {
    echo "Sublime Text installation"
}

is_installed() {
    command -v sublime-text &> /dev/null
}

run() {
    sudo snap install sublime-text --classic
}
