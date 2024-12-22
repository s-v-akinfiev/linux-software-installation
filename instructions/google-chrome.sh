get_title() {
    echo "Google Chrome installation"
}

is_installed() {
    command -v google-chrome-stable &> /dev/null
}

run() {
    wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmour -o /usr/share/keyrings/google_linux_signing_key.gpg
    sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google_linux_signing_key.gpg] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list'
    # sudo rm /etc/apt/sources.list.d/google-chrome.list
    sudo apt update
    sudo apt -y install google-chrome-stable
}
