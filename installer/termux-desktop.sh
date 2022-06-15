#!/bin/bash

R="$(printf '\033[1;31m')"
G="$(printf '\033[1;32m')"
Y="$(printf '\033[1;33m')"
B="$(printf '\033[1;34m')"
C="$(printf '\033[1;36m')"
W="$(printf '\033[1;37m')"

link="https://raw.githubusercontent.com/Marxde5/Termux-Desktop/main"

banner() {
    clear
    printf ${C}"██      ██  █████  ██████  ██     ██     ${B}██████  ███████ ██████  \n"
    printf ${C}"████  ████ ██   ██ ██   ██   ██ ██       ${B}██   ██ ██      ██      \n"
    printf ${C}"██  ██  ██ ██ █ ██ █████      ███   ${R}████ ${B}██   ██ ██████  ██████  \n"
    printf ${C}"██      ██ ███████ ██  ██    ██ ██       ${B}██   ██ ██           ██ \n"
    printf ${C}"██      ██ ██   ██ ██   ██ ██     ██     ${B}██████  ███████ ██████  \n"
    printf ${G}"                                 Sawah Ladang Serta Ikan-ikannya \n"
}

package() {
    echo -e "${R} [${W}-${R}]${C} Checking required packages..."${W}
    termux-setup-storage
    if [[ `command -v xfce*` && `command -v tigervnc` && `command -v wget` ]]; then
        echo -e "\n${R} [${W}-${R}]${G} Packages already installed."${W}
    else
        packs=(xfce* tigervnc  wget)
        for hulu in "${packs[@]}"; do
            type -p "$hulu" &>/dev/null || {
                echo -e "\n${R} [${W}-${R}]${G} Installing package : ${Y}$hulu${C}"${W}
                apt update -y
                apt upgrade -
                apt install x11-repo -y
                apt install "$hulu" -y
            }
        done
    fi
}
thic() {
    echo -e "${R} [${W}-${R}]${C} Install theme dan icon..."${W}
    mkdir .themes
    mkdir .icons
    wget -q $link/installer/themes.tar.xz
    tar -xf themes.tar.xz -C $HOME/.themes
    rm themes.tar.xz
    wget -q $link/installer/icons.tar.xz
    tar -xf icons.tar.xz -C $HOME/.icons
    rm icons.tar.xz
    echo -e "${R} [${W}-${R}]${C} Done..."${W}
    cd
}

setupvnc() {
    echo -e "${R} [${W}-${R}]${C} Setup VNC..."${W}

        wget -q $link/xfce/vncstart -P $PREFIX/bin
        chmod +x $PREFIX/bin/vncstart
        wget -q $link/xfce/vncstop -P $PREFIX/bi
        chmod +x $PREFIX/bin/vncsto
        wget -q $link/xfce/vnc -P $PREFIX/bin
        chmod +x $PREFIX/bin/vnc
    echo " "
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
chmod +x .vnc/xstartu
    chmod +x .vnc/xstartup
}

info() {
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
} 
banner
package
thic
setupvnc
info
vncpasswd
vncstart
