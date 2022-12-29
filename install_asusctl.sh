
#!/bin/bash
function update(){
	apt-get update -y
	apt-get upgrade -y
	apt-get autoremove -y
}

update > /dev/null

#asusctl
function install_asusctl(){
    echo "---> Instalando Dependencias ... "
    apt-get build-essential cmake libclang-dev libudev-dev libglib2.0-dev libgtk2.0-dev libgtk-3-dev nvidia-driver-525 nvidia-dkms-525 curl -y > /dev/null
    echo "---> Clonando Repositorios ... "
    git clone https://gitlab.com/asus-linux/asusctl.git > /dev/null
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    make
    make install
    source "$HOME/.cargo/env"
    systemctl start asusd
}

echo "Instalando Asusctl for ASUS ROG..."
install_asusctl
echo "Enjoy 3:)"
