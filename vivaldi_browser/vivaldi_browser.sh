#!/bin/bash
function update(){
	apt update
	apt upgrade -y
	apt autoremove -y
}

update

wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | sudo apt-key add -

if [ $(arch) == 'x86_64' ]; then archtype=[arch=amd64]; fi
text="deb ${archtype} https://repo.vivaldi.com/archive/deb/ stable main"

echo $text >> /etc/apt/sources.list.d/vivaldi.list

update