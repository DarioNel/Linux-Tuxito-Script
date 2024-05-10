#!/bin/bash

# Declaramos la funcion actualizar el sistema
function updates(){
        echo "Vamos a actualizar el sistema"
        apt update && apt upgrade -y
        echo "El sistema fue acutalizado correctamente"
}

# Declaramos una funcion con los programas esenciales para el sistema

function SystemApps(){
        echo "Vamos a Instalar las aplicaciones necesarias del sistema"
        apt install sudo ufw iputils-ping net-tools network-manager wireless-tools pulseaudio pavucontrol tree neofetch htop synaptic build-essential ntfs-3g gvfs-backends gvfs-fuse numlockx fonts-arphic-uming fonts-ipafont-mincho fonts-unfonts-core papirus-icon-theme dmz-cursor-theme libreoffice libreoffice-gtk3 firefox-esr vlc cheese simple-scan mate-calc -y
        echo "Los paquetes fueron instalados correctamente"
}

# Iniciamos el bucle while.
while [[ $aux -ne 1 && $aux -ne 2 && $aux -ne 3 && $aux -ne 4 ]]; do
	# Selecion del entorno de escritorio
	echo ""
	echo -e "\e[33m#-----------------------------------------------------------------------------#\e[m"
	echo -e "\033[0;33m _     _                    _____           _ _               ___  ____  "
	echo -e "| |   (_)_ __  _   ___  __ |_   _|   ___  _(_) |_ ___        / _ \/ ___| "
	echo -e "| |   | | '_ \| | | \ \/ /   | || | | \ \/ / | __/ _ \ _____| | | \___ \ "
	echo -e "| |___| | | | | |_| |>  <    | || |_| |>  <| | || (_) |_____| |_| |___) |"
	echo -e "|_____|_|_| |_|\__,_/_/\_\   |_| \__,_/_/\_\_|\__\___/       \___/|____/ "
	echo -e "\033[0m"
	#
	echo -e "\e[34m-Bienvenido a la instalacion de Linux Tuxito-OS"
	echo -e "\e[34m-Autor: DarioNel\e[m"
	echo -e "\e[33m#-----------------------------------------------------------------------------#\e[m"
	echo -e "\e[34mAcontinuación elija el escritorio que desea instalar"
	echo ""
	echo -e "Presione\e[m"
	echo -e ""
	echo -e "\e[32m 1 Para instalar Gnome Desktop"
	echo -e " 2 Para instalar Mate Desktop"
	echo -e " 3 Para instalar Xfce Desktop"
	echo -e " 4 Para instalar i3wm\e[32m"
	echo -e "\e[31m 0 Para salir de la instalación\e[m"
	#echo -e "\e[32m"
	read desktop

	case $desktop in
		1)
		echo "Instalando Gnome Desktop"
  		updates
		apt install gnome-core gdm3 mutter gnome-session gnome-control-center gnome-tweaks nautilus gnome-power-manager gnome-disk-utility gnome-system-monitor gnome-terminal network-manager-gnome gnome-screenshot gedit eog evince -y
		SystemApps
		echo "La Instalacion se a realizado exitosamente"
		aux=1
		;;
		2)
		echo "Instalando Mate Desktop"
  		updates
		SystemApps
		mkdir -p /root/.config
		cp -v -r mate /root/.config/
		apt install mate-core lightdm mate-panel mate-applet-brisk-menu mate-menu marco mate-session-manager mate-control-center mate-tweak caja mate-power-manager  gnome-disk-utility mate-system-monitor mate-terminal network-manager-gnome mate-utils mate-media pluma eom atril -y
      		echo "La Instalacion se a realizado exitosamente"
		aux=2
		;;
		3)
		echo "Instalando Xfce Desktop"
  		updates
		apt install xfdesktop4 lightdm xfce4-panel xfce4-whiskermenu-plugin xfwm4 xfce4-session xfce4-settings thunar xfce4-power-manager gnome-disk-utility  xfce4-taskmanager xfce4-terminal network-manager-gnome xfce4-screenshooter xfce4-notifyd mugshot xfce4-pulseaudio-plugin mousepad ristretto evince -y
		SystemApps
    		mkdir -p /root/.config
		cp -v -r xfce4 /root/.config/
	        echo "La Instalacion se a realizado exitosamente"
		aux=3
		;;
		4)
		echo "Instalando i3wm"
  		updates
		apt install xorg lightdm i3status rofi i3 thunar xfce4-power-manager kitty xfce4-screenshooter light-locker lxappearance policykit-1-gnome picom eom atril mousepad -y
		SystemApps
  		mkdir -p /root/.config/
  	  	mkdir -p /root/.config/i3/
		mkdir -p /root/.config/gtk-3.0/
  		cp -v config /root/.config/i3/
		# Borramos el archivo settings.ini con un echo vacio.
		echo "" > /root/.config/gtk-3.0/settings.ini
		# Creamos una variable donde ponemos las configuraciones en un string
		i3theme="
		[Settings]
		gtk-theme-name=Adwaita-dark
		gtk-icon-theme-name=ePapirus-Dark
		gtk-font-name=Sans 10
		gtk-cursor-theme-name=DMZ-White
		gtk-cursor-theme-size=0
		gtk-toolbar-style=GTK_TOOLBAR_BOTH
		gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
		gtk-button-images=1
		gtk-menu-images=1
		gtk-enable-event-sounds=1
		gtk-enable-input-feedback-sounds=1
		gtk-xft-antialias=1
		gtk-xft-hinting=1
		gtk-xft-hintstyle=hintfull
		gtk-modules=gail:atk-bridge
		"
		# Imprimimos el contenido dentro del archivo settings.ini con todas las configuraciones.
		echo "$i3theme" > /root/.config/gtk-3.0/settings.ini
	        echo "La Instalacion se a realizado exitosamente"
		aux=4
		;;
		0)
		echo "Saliendo de la instalacion ..."
		exit
		;;
		*)
		echo "La opcion es incorrecta, vuelva a intentarlo"
		;;
	esac
done

# Actualizamos los modulos del kernel
apt install  linux-headers-$(uname -r) -y

# Copiamos los temas e iconos
cp -v -r themes/Flat-Remix-* /usr/share/themes/
cp -v -r icons/Flat-Remix-*  /usr/share/icons/
cp -v tuxi.png /usr/share/icons/

# Creamos el directorio background
mkdir -p /usr/share/backgrounds/

# Copiamos los fondos de pantalla al directorio backgrounds y desktop-base
cp -v -r fondos /usr/share/backgrounds/
cp -v -r fondos/*.jpeg *.png /usr/share/images/desktop-base/

# Personalizamos el lightdm

# Borramos el archivo 01_debian.conf con un echo vacio.
echo "" > /usr/share/lightdm/lightdm-gtk-greeter.conf.d/01_debian.conf

# Creamos una variable donde ponemos las configuraciones en un string
lightdm="
# Debian specific defaults

[greeter]
#background=/usr/share/images/desktop-base/login-background.svg
background=/usr/share/backgrounds/fondos/tuxito.png
theme-name=Adwaita
xft-antialias=true
xft-hintstyle=hintfull
xft-rgba=rgb
reader=orca

# Login
theme-name = Adwaita-dark
default-user-image = /usr/share/icons/tuxi.png
position = 8%,start 63%,center
icon-theme-name = ePapirus-Dark
"
# Imprimimos el contenido dentro del archivo 01_debian.conf con todas las configuraciones.
echo "$lightdm" > /usr/share/lightdm/lightdm-gtk-greeter.conf.d/01_debian.conf

# Cambiamos la imagen del grub
cp -v fondos/grub-16x9.png  /usr/share/desktop-base/active-theme/grub/
cp -v fondos/grub-4x3.png  /usr/share/desktop-base/active-theme/grub/

# Creamos el directorio neofetch
mkdir -p /root/.config/neofetch/

# Copiamos los archivos de configuracion de neofetch
cp -v config.conf /root/.config/neofetch/

# Borramos el archivo os-release con un echo vacio.
echo "" > /etc/os-release

# Creamos una variable donde ponemos las configuraciones en un string
distro='
PRETTY_NAME="Tuxito-OS GNU/Linux"
NAME="Tuxito-OS GNU/Linux"
VERSION_ID="12"
VERSION="12 (bookworm)"
VERSION_CODENAME=bookworm
ID=debian
HOME_URL="https://www.debian.org/"
SUPPORT_URL="https://www.debian.org/support"
BUG_REPORT_URL="https://bugs.debian.org/"
'
# Imprimimos el contenido dentro del archivo os-release con todas las configuraciones.
echo "$distro" > /etc/os-release

# Desabilitamos algunas configuraciones en el adaptador, para poder scanear las redes.

# Borramos el archivo interfaces con un echo vacio.
echo "" > /etc/network/interfaces

# Creamos una variable donde ponemos las configuraciones en un string
net="
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

source /etc/network/interfaces.d/*

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
#allow-hotplug [adaptador]
#iface [adaptador] inet dhcp
#       wpa-ssid red
#       wpa-psk  passwd
"
# Imprimimos el contenido dentro del archivo interfaces con todas las configuraciones.
echo "$net" > /etc/network/interfaces

# Agregamos nuestro usuario al archivo sudores

echo "# Damos privilegios de sudo a nuestro usuario" >> /etc/sudoers
echo "linux  ALL=(ALL:ALL) ALL" >> /etc/sudoers

# Copiamos toda la configuracion del usuario root al usuario que creamos
cp -v -r /root/.config/ /home/linux

# Cambiar los permisos de usuario
chown -R linux:linux /home/linux/.config

# Agregar al PATH las rutas del sistema para el usuario que creamos instalacion
echo "export PATH=$PATH:/bin:/usr/bin:/sbin:/usr/sbin" >> /home/linux/.bashrc
source /home/linux/.bashrc

# Habilitamos el firewall
ufw enable

# Actualizamos el grub
update-grub

# Actualizo el sistema y reinicio
updates
reboot
