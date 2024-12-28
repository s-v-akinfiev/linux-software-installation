get_title() {
    echo "Anydesk installation"
}

is_installed() {
    command -v anydesk &> /dev/null
}

run() {
    wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add -
    echo "deb http://deb.anydesk.com/ all main" | sudo tee /etc/apt/sources.list.d/anydesk.list
    sudo apt update -y
    sudo apt install anydesk -y
}
