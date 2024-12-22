get_title() {
    echo "Guake installation"
}

is_installed() {
    command -v guake &> /dev/null && return 0 || return 1
}

run() {
    sudo apt -y install guake
    guake --save-preferences=myprefs.cfg
    sed -i "3i start-at-login=true" myprefs.cfg
    sed -i "3i use-trayicon=false" myprefs.cfg
    echo -e "\n[keybindings/global]" | tee -a myprefs.cfg
    echo -e "show-hide='F1'" | tee -a myprefs.cfg
    guake --restore-preferences=myprefs.cfg
    ## TODO: seems it does not remove the dummy file
    rm myprefs.cfg && guake &
}
