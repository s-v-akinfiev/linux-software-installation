get_title() {
    echo "KDE Plasma installation"
}

is_installed() {
    dpkg -l | grep kde-plasma &> /dev/null
}

run() {
    sudo apt install -y kde-plasma-desktop
    sudo apt install -y kubuntu-desktop
    sudo apt remove -y ark gnome-characters gnome-clocks elisa kcharselect \
        dolphin dolphin-plugins gwenview haruna kinfocenter khelpcenter \
        kate krdc kdeconnect ksystemlog kfind konversation okular \
        okular-extra-backends neochat seahorse skanlite skanpage
}
