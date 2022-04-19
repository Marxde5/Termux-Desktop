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

echo "Anda sekarang dapat memulai vncserver dengan menjalankan vncstart"
echo " "
echo "Ini akan meminta Anda untuk memasukkan kata sandi saat pertama kali memulainya."
echo " "
echo "Server VNC akan dimulai pada 127.0.0.1:5901"
echo " "
echo "Anda dapat terhubung ke alamat ini dengan VNC Viewer yang Anda inginkan"
echo " "
echo "Hubungkan ke alamat ini akan membuka jendela dengan Lingkungan Desktop Xfce4"
echo " "
echo " "
echo "Menjalankan vncstart"
echo " "
echo " "
echo "Untuk Membunuh Server VNC jalankan vncstop"
echo " "
echo " "

vncpasswd
vncstart
