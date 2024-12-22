get_title() {
    echo "Shutter installation"
}

is_installed() {
    command -v shutter &> /dev/null
}

run() {
    sudo add-apt-repository -y universe
    sudo apt update
    sudo apt install -y shutter
}
