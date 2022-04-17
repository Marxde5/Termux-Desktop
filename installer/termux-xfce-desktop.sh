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

wget -q $link/xfce/vncpasswd -P $PREFIX/bin
wget -q $link/xfce/vncstart -P $PREFIX/bin
wget -q $link/xfce/vncstop -P $PREFIX/bin
chmod +x $PREFIX/bin/vncpasswd
chmod +x $PREFIX/bin/vncstart
chmod +x $PREFIX/bin/vncstop

echo "#!/data/data/com.termux/files/usr/bin/bash
vncserver -localhost  $GEO :$PORT
echo "VNC server started. The default password is the account password for $USER" >> $PREFIX/bin

chmod +x $PREFIX/bin/vnc

echo "You can now start vncserver by running tstart"
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
echo "Running vncstart"
echo " "
echo " "
echo "To Kill VNC Server just run tstop"
echo " "
echo " "

vncpasswd
tstart
