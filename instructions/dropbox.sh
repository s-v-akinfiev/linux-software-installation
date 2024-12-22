get_title() {
    echo "Dropbox installation"
}

is_installed() {
    command -v dropbox &> /dev/null
}

run() {
    sudo apt install -y python3-gpg libpango1.0-0
    wget https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2020.03.04_amd64.deb
    sudo dpkg -i dropbox_2020.03.04_amd64.deb
    rm dropbox_2020.03.04_amd64.deb
}
