get_title() {
    echo "YouTube music installation"
}

is_installed() {
    command -v youtube-music &> /dev/null
}

run() {
    wget https://github.com/th-ch/youtube-music/releases/download/v1.19.0/youtube-music_1.19.0_amd64.deb
    sudo dpkg -i youtube-music_1.19.0_amd64.deb
    sudo apt-get install -f
    rm youtube-music_1.19.0_amd64.deb
}
