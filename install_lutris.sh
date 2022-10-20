#!/bin/bash
function update(){
	apt-get update -y
	apt-get upgrade -y
	apt-get autoremove -y
}

LTRS=lutris-all.deb

function install_lutris(){
	echo "---> Descargando Paquetes  ... "
	wget -qO $LTRS https://github.com/lutris/lutris/releases/download/v0.5.12-beta1/lutris_0.5.12_beta1_all.deb
	echo "---> Instalando Paquetes Adicionales ... "
	apt install curl fluid-soundfont-gm fluid-soundfont-gs mesa-utils mesa-utils-bin p7zip python3-bs4 python3-html5lib python3-lxml python3-magic python3-setproctitle python3-soupsieve python3-webencodings -y > /dev/null
    echo "---> Install ... "
	dpkg -i $LTRS > /dev/null
	echo "---> Actualizando ... "
	update > /dev/null
	echo ""
}

echo "Instalando Lutris ..."
install_lutris
echo "Enjoy 3:)"
