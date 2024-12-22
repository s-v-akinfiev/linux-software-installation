get_title() {
    echo "mkcert installation"
}

is_installed() {
    command -v mkcert &> /dev/null
}

run() {
    wget https://github.com/FiloSottile/mkcert/releases/download/v1.1.2/mkcert-v1.1.2-linux-amd64
    mv mkcert-v1.1.2-linux-amd64 mkcert
    chmod +x mkcert
    sudo cp mkcert /usr/local/bin/
    mkcert -install
}

