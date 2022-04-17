#!/data/data/com.termux/files/usr/bin/bash
link="https://github.com/MarxD5/X10D5/blob/main"
pkg install wget -y
pkg install proot-distro
proot-distro install ubuntu
proot-distro login ubuntu
apt update -y
apt install sudo nano wget
wget -q $link/xfce/xfce.sh -P /root
chmod +x /root
bash xfce.sh
rm xfce.sh
logout
