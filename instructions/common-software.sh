get_title() {
    echo "vim, htop, curl, git, keepassxc, and vlc installation"
}

run() {
    sudo apt -y install vim htop curl git libfuse2 libnss3-tools
    sudo apt-get install -y keepassxc vlc
    sudo update-alternatives --config editor
}
