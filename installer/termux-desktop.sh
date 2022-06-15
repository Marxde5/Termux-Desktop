#!/bin/bash

link="https://raw.githubusercontent.com/Marxde5/Termux-Desktop/main"                                                                 R="$(printf '\033[1;31m')"

G="$(printf '\033[1;32m')"                                                                      Y="$(printf '\033[1;33m')"
B="$(printf '\033[1;34m')"                                                                      C="$(printf '\033[1;36m')"
W="$(printf '\033[1;37m')"

banner() {                                                                                          clear
    printf ${C}"██      ██  █████  ██████  ██     ██     ${B}██████  ███████ ██████  \n"
    printf ${C}"████  ████ ██   ██ ██   ██   ██ ██       ${B}██   ██ ██      ██      \n"
    printf ${C}"██  ██  ██ ██ █ ██ █████      ███   ${R}████ ${B}██   ██ ██████  ██████  \n"
    printf ${C}"██      ██ ███████ ██  ██    ██ ██       ${B}██   ██ ██           ██ \n"
    printf ${C}"██      ██ ██   ██ ██   ██ ██     ██     ${B}██████  ███████ ██████  \n"
    printf ${G}"                                 Sawah Ladang Serta Ikan-ikannya \n"
}
pkg update -y && pkg upgrade
pkg install x11-repo
pkg install wget
pkg install xfce* tigervnc
mkdir .themes
mkdir .icons
mkdir .vnc
echo "#!/data/data/com.termux/files/usr/bin/sh
## This file is executed during VNC server
## startup.

# Launch terminal emulator Aterm.
# Requires package 'aterm'.
aterm -geometry 80x24+10+10 -ls &

# Launch Tab Window Manager.
# Requires package 'xorg-twm'.
twm &
startxfce4 &" >> .vnc/xstartup
chmod +x .vnc/xstartup

wget -q $link/xfce/vncstart -P $PREFIX/bin
wget -q $link/xfce/vncstop -P $PREFIX/bin
wget -q $link/xfce/vnc -P $PREFIX/bin
chmod +x $PREFIX/bin/vncstart
chmod +x $PREFIX/bin/vncstop
chmod +x $PREFIX/bin/vnc

echo "Anda sekarang dapat memulai vncserver dengan menjalankan tstart"
echo " "
echo "Ini akan meminta Anda untuk memasukkan kata sandi saat pertama kali memulainya."
echo " "
echo "Server VNC akan dimulai pada 127.0.0.1:5901"
echo " "
echo "Anda dapat terhubung ke alamat ini dengan VNC Viewer yang Anda inginkan"
echo " "
echo "Hubungkan ke alamat ini akan membuka jendela dengan Lingkungan Desktop Xfce4"
echo " "
echo "Menjalankan vncstart"
echo " "
echo "Untuk Membunuh Server VNC jalankan vncstop"
echo " "

vncpasswd
vncstart
