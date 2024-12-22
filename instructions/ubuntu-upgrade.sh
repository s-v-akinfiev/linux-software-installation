get_title() {
    echo "Apply latest ubuntu upgrades"
}

run() {
    sudo apt update && sudo apt -y upgrade
}
