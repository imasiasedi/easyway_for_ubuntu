#!/bin/bash
function update(){
	apt update
	apt upgrade -y
	apt autoremove -y
}

update

wget -qO- https://packagecloud.io/shiftkey/desktop/gpgkey | sudo apt-key add -
if [ $(arch) == 'x86_64' ]; then archtype=[arch=amd64]; fi
text="deb ${archtype} https://packagecloud.io/shiftkey/desktop/any/ any main"
echo $text >> /etc/apt/sources.list.d/shiftkey-desktop.list

update

apt install github-desktop -y