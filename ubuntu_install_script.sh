#!/usr/bin/env bash
set -e
set -x

# Upgrade system
sudo apt update && sudo apt -y upgrade

# System confuration
dconf write /org/gnome/desktop/sound/event-sounds false
sudo swapoff -a && sudo sed -i '/ swap / s/^/#/' /etc/fstab
gsettings set org.gnome.shell.extensions.dash-to-dock show-trash false
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false
gsettings set org.gnome.shell.extensions.dash-to-dock multi-monitor true
gsettings set org.gnome.desktop.privacy remember-recent-files false
gsettings set org.gnome.shell.extensions.dash-to-dock scroll-action 'do-nothing'
gsettings set org.gnome.shell.extensions.ding show-home false
sudo apt-get purge -y aisleriot gnome-sudoku gnome-mines cheese gnome-mahjongg shotwell

## Screenshots directory change
if [ ! -d ~/misc/screenshots/ ]
then
  cd ~/Pictures
  mkdir -p ~/misc/screenshots
  ln -s ~/misc/screenshots/ Screenshots
  echo 'Screenshots' >> .hidden
  cd -
fi

# Install software
sudo apt -y install vim htop curl git telegram-desktop libfuse2 libnss3-tools
sudo apt-get install -y keepassxc vlc
if ! command -v postman &> /dev/null; then sudo snap install postman; fi
if ! command -v sublime-text &> /dev/null; then sudo snap install sublime-text --classic; fi

## Slack
if command -v slack &> /dev/null; then sudo snap remove slack; fi
wget https://packagecloud.io/slacktechnologies/slack/gpgkey -O slack.gpg
sudo apt-key add slack.gpg
echo "deb https://packagecloud.io/slacktechnologies/slack/debian/ jessie main" | sudo tee /etc/apt/sources.list.d/slack.list
sudo apt-get update
sudo apt-get install slack-desktop
rm slack.gpg

## Guake
if ! command -v guake &> /dev/null
then
  sudo apt -y install guake
  guake --save-preferences=myprefs.cfg
  sed -i "3i start-at-login=true" myprefs.cfg
  sed -i "3i use-trayicon=false" myprefs.cfg
  echo -e "\n[keybindings/global]" | tee -a myprefs.cfg
  echo -e "show-hide='F1'" | tee -a myprefs.cfg
  guake --restore-preferences=myprefs.cfg
  ## TODO: seems it does not remove the dummy file
  rm myprefs.cfg && guake &
fi

## Chrome
if ! command -v google-chrome-stable &> /dev/null
then
  wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmour -o /usr/share/keyrings/google_linux_signing_key.gpg
  sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google_linux_signing_key.gpg] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list'
  #sudo rm /etc/apt/sources.list.d/google-chrome.list
  sudo apt update
  sudo apt -y install google-chrome-stable
fi

## Clipboard Indicator GNOME Extension
if ! gnome-extensions list | grep clipboard-indicator@tudmotu.com
then
  git clone https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator.git ~/.local/share/gnome-shell/extensions/clipboard-indicator@tudmotu.com
  gsettings set org.gnome.shell disable-user-extensions false
  #killall -3 gnome-shell
  #gnome-extensions enable clipboard-indicator@tudmotu.com
  #dconf write /org/gnome/shell/extensions/clipboard-indicator/toggle-menu  "['<Control><Alt>h']"
fi

## YouTube Music
if ! command -v youtube-music &> /dev/null
then
  wget https://github.com/th-ch/youtube-music/releases/download/v1.19.0/youtube-music_1.19.0_amd64.deb
  sudo dpkg -i youtube-music_1.19.0_amd64.deb
  sudo apt-get install -f
  rm youtube-music_1.19.0_amd64.deb
fi

## Dropbox
if ! command -v dropbox &> /dev/null
then
  sudo apt install -y python3-gpg libpango1.0-0
  wget https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2020.03.04_amd64.deb
  sudo dpkg -i dropbox_2020.03.04_amd64.deb
  rm dropbox_2020.03.04_amd64.deb
fi

## PhpStorm
if [ ! -f /opt/jetbrains/jetbrains-toolbox ]
then
  wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.27.3.14493.tar.gz
  sudo tar -xvzf jetbrains-toolbox-1.27.3.14493.tar.gz -C /opt/ && sudo mv /opt/jetbrains-toolbox-1.27.3.14493 /opt/jetbrains
  rm jetbrains-toolbox-1.27.3.14493.tar.gz
  cd /opt/jetbrains
  ./jetbrains-toolbox
  cd -
fi

## Docker
if ! command -v docker &> /dev/null
then
  sudo apt-get -y install ca-certificates curl gnupg lsb-release
  sudo mkdir -m 0755 -p /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt-get update
  sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  sudo groupadd -f docker
  sudo usermod -aG docker $USER
fi

## mkcert
if ! command -v mkcert &> /dev/null
then
  wget https://github.com/FiloSottile/mkcert/releases/download/v1.1.2/mkcert-v1.1.2-linux-amd64
  mv mkcert-v1.1.2-linux-amd64 mkcert
  chmod +x mkcert
  sudo cp mkcert /usr/local/bin/
  mkcert -install
fi

## Safeeye
if ! command -v safeeyes &> /dev/null
then
  sudo add-apt-repository -y ppa:slgobinath/safeeyes
  sudo apt-get update
  sudo apt install -y safeeyes
fi

## Shutter
if ! command -v shutter &> /dev/null
then
  sudo add-apt-repository -y universe
  sudo apt update
  sudo apt install -y shutter
fi

## TeamViewer
if ! command -v teamviewer &> /dev/null
then
  wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
  sudo dpkg -i teamviewer_amd64.deb
  sudo apt --fix-broken install
  rm teamviewer_amd64.deb
fi

# Git configure
if ! cat ~/.gitignore | grep idea
then
  echo '.idea' > ~/.gitignore
  git config --global core.excludesfile ~/.gitignore
fi

# Directories prepare
if ! cat ~/.config/user-dirs.dirs | grep -o desktop
then
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
fi

mkdir -p ~/misc/apps
mkdir -p ~/misc/certs
mkdir -p ~/misc/db
mkdir -p ~/misc/projects

sudo sed -i "s/#WaylandEnable/WaylandEnable/g" /etc/gdm3/custom.conf
sudo update-alternatives --config editor

reboot

exit

=====================================

README.md

git clone
./ubuntu_install_script.sh


sudo service docker stop
sudo apt-get purge docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras
reboot
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin=2.17.3-1~ubuntu.22.04~jammy