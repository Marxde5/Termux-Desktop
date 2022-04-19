#!/data/data/com.termux/files/usr/bin/bash
link="https://github.com/MarxD5/X10D5/blob/main"
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
chmod +x $PREFIX/bin/vncstart
chmod +x $PREFIX/bin/vncstop

echo "#!/data/data/com.termux/files/usr/bin/bash
vncserver -localhost  $GEO :$PORT
echo "VNC server started. The default password is the account password for $USER" >> $PREFIX/bin/vnc

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
echo " "
echo "Menjalankan vncstart"
echo " "
echo " "
echo "Untuk Membunuh Server VNC jalankan tstop"
echo " "
echo " "

vncpasswd
vncstart
