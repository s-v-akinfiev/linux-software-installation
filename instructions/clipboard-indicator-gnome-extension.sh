get_title() {
    echo "Clipboard Indicator GNOME Extension installation"
}

is_installed() {
    gnome-extensions list | grep -q "clipboard-indicator@tudmotu.com"
}

run() {
    git clone https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator.git ~/.local/share/gnome-shell/extensions/clipboard-indicator@tudmotu.com
    gsettings set org.gnome.shell disable-user-extensions false
    # killall -3 gnome-shell
    # gnome-extensions enable clipboard-indicator@tudmotu.com
    # dconf write /org/gnome/shell/extensions/clipboard-indicator/toggle-menu  "['<Control><Alt>h']"
}
