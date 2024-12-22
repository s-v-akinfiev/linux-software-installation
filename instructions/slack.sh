get_title() {
    echo "Slack installation"
}

run() {
    if command -v slack &> /dev/null; then sudo snap remove slack; fi
    wget https://packagecloud.io/slacktechnologies/slack/gpgkey -O slack.gpg
    sudo apt-key add slack.gpg
    echo "deb https://packagecloud.io/slacktechnologies/slack/debian/ jessie main" | sudo tee /etc/apt/sources.list.d/slack.list
    sudo apt-get update
    sudo apt-get install slack-desktop
    rm slack.gpg
}