get_title() {
    echo "Jetbrains tool installation"
}

is_installed() {
    [[ -f /opt/jetbrains/jetbrains-toolbox ]]
}

run() {
    wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.27.3.14493.tar.gz
    sudo tar -xvzf jetbrains-toolbox-1.27.3.14493.tar.gz -C /opt/ && sudo mv /opt/jetbrains-toolbox-1.27.3.14493 /opt/jetbrains
    rm jetbrains-toolbox-1.27.3.14493.tar.gz
    cd /opt/jetbrains
    ./jetbrains-toolbox
    cd -
}
