get_title() {
    echo "Transmission installation"
}

is_installed() {
    command -v transmission-qt &> /dev/null
}

run() {
    sudo apt-get install transmission-qt
}
