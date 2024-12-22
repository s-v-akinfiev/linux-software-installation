get_title() {
    echo "Gnome configuration"
}

run() {
    dconf write /org/gnome/desktop/sound/event-sounds false
    gsettings set org.gnome.shell.extensions.dash-to-dock show-trash false
    gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false
    gsettings set org.gnome.shell.extensions.dash-to-dock multi-monitor true
    gsettings set org.gnome.desktop.privacy remember-recent-files false
    gsettings set org.gnome.shell.extensions.dash-to-dock scroll-action 'do-nothing'
    gsettings set org.gnome.shell.extensions.ding show-home false
    sudo apt-get purge -y aisleriot gnome-sudoku gnome-mines cheese gnome-mahjongg shotwell
}
