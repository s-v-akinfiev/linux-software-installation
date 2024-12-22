get_title() {
    echo "Wayland screen server disabling"
}

run() {
    sudo sed -i "s/#WaylandEnable/WaylandEnable/g" /etc/gdm3/custom.conf
}
