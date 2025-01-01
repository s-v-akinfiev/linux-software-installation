get_title() {
    echo "TP-Link TL-WN722N driver installation"
}

run() {
    sudo apt install -y build-essential dkms git
    git clone https://github.com/aircrack-ng/rtl8188eus.git
    cd rtl8188eus
    sudo make
    sudo make install
    cd -
    rm -r rtl8188eus

    sudo modprobe 8188eu
    echo "blacklist rtl8xxxu" | sudo tee /etc/modprobe.d/rtl8xxxu.conf
    sudo modprobe -r rtl8xxxu
}
