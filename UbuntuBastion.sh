#!/bin/bash -e
#Ubuntu BAstion SCript
#dont forget to run  chmod 700
sudo apt-get update && sudo apt-get upgrade -y
sudo useradd -m rdp
sudo usermod -aG sudo rdp
echo "rdp:password" | sudo chpasswd
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install xrdp -y 
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install xfce4 -y
sudo echo xfce4-session > ~/.xsession
sudo service xrdp restart
sudo sed  '/#background=626c72/a address=0.0.0.0' /etc/xrdp/xrdp.ini
sudo service xrdp restart
sudo ufw allow 3389
echo startxfce4 | sudo tee -a /etc/xrdp/startwm.sh
sudo service xrdp restart
sudo apt-get install remmina -y