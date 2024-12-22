get_title() {
    echo "Postman installation"
}

is_installed() {
    command -v postman &> /dev/null
}

run() {
    sudo snap install postman
}
