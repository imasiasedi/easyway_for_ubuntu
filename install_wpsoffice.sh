#!/bin/bash
function update(){
	apt-get update -y
	apt-get upgrade -y
	apt-get autoremove -y
}

function wps_office(){
	echo "---> Descargando Paquetes  ... "
	wget -q https://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/10920/wps-office_11.1.0.10920.XA_amd64.deb
	dpkg -i wps-office_11.1.0.10920.XA_amd64.deb
	
    echo "Installing Fonts..."
	git clone https://github.com/iamdh4/ttf-wps-fonts.git
	cp ttf-wps-fonts/*.ttf /usr/share/fonts/wps-office/

	echo "Eliminando Fuentes"
	rm -R ttf-wps-fonts/
	rm wps-office_11.1.0.10920.XA_amd64.deb
}

echo "Instalando WPS Office ..."
wps_office
echo "Enjoy 3:)"