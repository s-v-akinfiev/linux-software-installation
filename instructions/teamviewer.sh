get_title() {
    echo "Teamviewer installation"
}

is_installed() {
    command -v teamviewer &> /dev/null
}

run() {
    wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
    sudo dpkg -i teamviewer_amd64.deb
    sudo apt --fix-broken install
    rm teamviewer_amd64.deb
}
