#!/bin/bash
#Get the necessary components
link="https://github.com/MarxD5/X10D5/blob/main"

sudo apt-get update
sudo apt install udisks2 -y
echo "" > /var/lib/dpkg/info/udisks2.postinst
sudo dpkg --configure -a
sudo apt-mark hold udisks2
sudo apt-get install keyboard-configuration -y
sudo apt-get install tzdata -y
sudo apt-get install sudo wget nano inetutils-tools dialog -y
sudo apt-get install xfce4 xfce4-goodies xfce4-terminal exo-utils tigervnc-standalone-server tigervnc-common dbus-x11 --no-install-recommends -y
sudo apt-get clean

wget -q $link/xfce/vnc -P /usr/local/bin
wget -q $link/xfce/vncpasswd -P /usr/local/bin
wget -q $link/xfce/vncstart -P /usr/local/bin
wget -q $link/xfce/vncstop -P /usr/local/bin
chmod +x /usr/local/bin/vnc
chmod +x /usr/local/bin/vncpasswd
chmod +x /usr/local/bin/vncstart
chmod +x /usr/local/bin/vncstop

echo "You can now start vncserver by running vncstart"
echo " "
echo "It will ask you to enter a password when first time starting it."
echo " "
echo "The VNC Server will be started at 127.0.0.1:5901"
echo " "
echo "You can connect to this address with a VNC Viewer you prefer"
echo " "
echo "Connect to this address will open a window with Xfce4 Desktop Environment"
echo " "
echo " "
echo " "
echo "Running vncstart"
echo " "
echo " "
echo " "
echo "To Kill VNC Server just run vncstop"
echo " "
echo " "
echo " "

vncpasswd
vncstart
