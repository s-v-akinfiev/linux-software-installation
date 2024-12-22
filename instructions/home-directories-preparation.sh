get_title() {
    echo "Home directories preparation"
}

is_installed() {
    grep -q "desktop" ~/.config/user-dirs.dirs
}

run() {
    sed -i "s/Desktop/desktop/g" ~/.config/user-dirs.dirs
    mv ~/Desktop ~/desktop
    sed -i "s/Downloads/downloads/g" ~/.config/user-dirs.dirs
    mv ~/Downloads ~/downloads
    sed -i "s/Templates/templates/g" ~/.config/user-dirs.dirs
    mv ~/Templates ~/templates
    sed -i "s/Public/public/g" ~/.config/user-dirs.dirs
    mv ~/Public ~/public
    sed -i "s/Documents/documents/g" ~/.config/user-dirs.dirs
    mv ~/Documents ~/documents
    sed -i "s/Music/music/g" ~/.config/user-dirs.dirs
    mv ~/Music ~/music
    sed -i "s/Pictures/pictures/g" ~/.config/user-dirs.dirs
    mv ~/Pictures ~/pictures
    sed -i "s/Videos/videos/g" ~/.config/user-dirs.dirs
    mv ~/Videos ~/videos

    mkdir -p ~/misc/apps
    mkdir -p ~/misc/certs
    mkdir -p ~/misc/db
}
