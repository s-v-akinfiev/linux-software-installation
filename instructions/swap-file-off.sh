get_title() {
    echo "Disabling swap file"
}

run() {
    sudo swapoff -a && sudo sed -i '/ swap / s/^/#/' /etc/fstab
}
