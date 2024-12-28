get_title() {
    echo "KDE Plasma installation"
}

is_installed() {
    dpkg -l | grep kde-plasma &> /dev/null
}

run() {
    sudo apt install kde-plasma-desktop
    sudo apt install kubuntu-desktop
}
