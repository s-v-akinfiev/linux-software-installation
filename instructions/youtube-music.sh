get_title() {
    echo "YouTube music installation"
}

is_installed() {
    command -v youtube-music &> /dev/null
}

run() {
    wget https://github.com/th-ch/youtube-music/releases/download/v3.7.1/youtube-music_3.7.1_amd64.deb
    sudo dpkg -i youtube-music_3.7.1_amd64.deb
    sudo apt-get install -f
    rm youtube-music_3.7.1_amd64.deb
}
