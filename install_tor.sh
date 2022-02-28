#!/bin/bash
function update(){
	apt-get update -y
	apt-get upgrade -y
	apt-get autoremove -y
}

update > /dev/null

if [ $(arch) == 'x86_64' ]; then archtype=[arch=amd64]; fi
text="deb ${archtype} https://deb.torproject.org/torproject.org/ $(lsb_release -cs) main"
echo $text >> /etc/apt/sources.list.d/tor.list
wget -qO- https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | apt-key add -

update
sudo apt install tor tor-geoipdb torsocks deb.torproject.org-keyring -y
