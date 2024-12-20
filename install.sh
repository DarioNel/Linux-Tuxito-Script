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

# Declaramos una funcion para copiar los temas e iconos a los Desktops

function themes(){
	# Copiamos los temas e iconos
	cp -r customization/themes/Flat-Remix-* /usr/share/themes/
	cp -r customization/icons/Flat-Remix-*  /usr/share/icons/
}

# Iniciamos el bucle while.
while [[ $aux -ne 1 && $aux -ne 2 && $aux -ne 3 && $aux -ne 4 && $aux -ne 5 && $aux -ne 6 && $aux -ne 7 && $aux -ne 8 ]]; do
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
	echo -e " 2 Para instalar KDE Plasma Desktop"
	echo -e " 3 Para instalar Cinnamon Desktop"
	echo -e " 4 Para instalar Mate Desktop"
	echo -e " 5 Para instalar Xfce Desktop"
	echo -e " 6 Para instalar Lxde Desktop"
	echo -e " 7 Para instalar Lxqt Desktop"
	echo -e " 8 Para instalar i3wm\e[32m"
	echo -e "\e[31m 0 Para salir de la instalación\e[m"
	#echo -e "\e[32m"
	read desktop

	case $desktop in
		1)
		echo "Instalando Gnome Desktop"
  		updates
		apt install gnome-core gdm3 mutter gnome-session gnome-control-center gnome-tweaks nautilus gnome-power-manager gnome-disk-utility gnome-system-monitor gnome-terminal network-manager-gnome gnome-screenshot gedit eog evince -y
		SystemApps
		themes
		mkdir -p /root/.config
		cp -r configurations/gnome/ /root/.config/
		echo "La Instalacion se a realizado exitosamente"
		aux=1
		;;
		2)
		echo "Instalando KDE Plasma Desktop"
  		updates
		apt install plasma-desktop sddm kwin systemsettings dolphin plasma-disks plasma-systemmonitor konsole ksnapshot kate gwenview okular -y
		SystemApps
		themes
		mkdir -p /root/.config
		cp -r configurations/kde/ /root/.config/
		echo "La Instalacion se a realizado exitosamente"
		aux=2
		;;
		3)
		echo "Instalando Cinnamon Desktop"
  		updates
		apt install cinnamon-core lightdm muffin cinnamon-control-center nemo cinnamon-settings-daemon gnome-disk-utility gnome-system-monitor gnome-terminal network-manager-gnome gnome-screenshot gedit eog evince -y
		SystemApps
		themes
		mkdir -p /root/.config
		cp -r configurations/cinnamon/* /root/.config/
		echo "La Instalacion se a realizado exitosamente"
		aux=3
		;;
		4)
		echo "Instalando Mate Desktop"
  		updates
		apt install mate-core lightdm mate-panel mate-applet-brisk-menu mate-menu marco mate-session-manager mate-control-center mate-tweak caja mate-power-manager  gnome-disk-utility mate-system-monitor mate-terminal network-manager-gnome mate-utils mate-media pluma eom atril -y
		SystemApps
		themes
		mkdir -p /root/.config
		cp -r configurations/mate/ /root/.config/
    		echo "La Instalacion se a realizado exitosamente"
		aux=4
		;;
		5)
		echo "Instalando Xfce Desktop"
  		updates
		apt install xfdesktop4 lightdm xfce4-panel xfce4-whiskermenu-plugin xfwm4 xfce4-session xfce4-settings thunar xfce4-power-manager gnome-disk-utility  xfce4-taskmanager xfce4-terminal network-manager-gnome xfce4-screenshooter xfce4-notifyd mugshot xfce4-pulseaudio-plugin mousepad ristretto evince -y
		SystemApps
		themes
    		mkdir -p /root/.config
		cp -r configurations/xfce4 /root/.config/
	   	echo "La Instalacion se a realizado exitosamente"
		aux=5
		;;
		6)
		echo "Instalando Lxde Desktop"
  		updates
		apt install lxde-core lightdm lxpanel lxsession-edit lxsession pcmanfm lxtask lxterminal nm-tray lxinput lxrandr lxappearance galculator mousepad gpicview evince -y
		SystemApps
		themes
    		mkdir -p /root/.config
		cp -r configurations/lxde/* /root/.config/
	   	echo "La Instalacion se a realizado exitosamente"
		aux=6
		;;
		7)
		echo "Instalando Lxqt Desktop"
  		updates
		apt install lxqt-core lightdm mousepad evince -y
		SystemApps
		themes
    		mkdir -p /root/.config
		cp -r configurations/lxqt /root/.config/
	   	echo "La Instalacion se a realizado exitosamente"
		aux=7
		;;
		8)
		echo "Instalando i3wm"
  		updates
		apt install xorg lightdm i3status rofi i3 thunar xfce4-power-manager sakura xfce4-screenshooter light-locker lxappearance policykit-1-gnome picom eom atril mousepad -y
		SystemApps
  		mkdir -p /root/.config/
  	  	mkdir -p /root/.config/i3/
		mkdir -p /root/.config/gtk-3.0/
  		cp -r configurations/i3wm/config /root/.config/i3/
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
		aux=8
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

# Creamos el directorio background
mkdir -p /usr/share/backgrounds/

# Copiamos los fondos de pantalla al directorio backgrounds 
cp -r customization/wallpapers/ /usr/share/backgrounds/
cp  customization/img/tuxi.png /usr/share/icons/
cp -r customization/icons/menu-debian/ /usr/share/icons/

# Cambiamos la imagen del grub
cp customization/wallpapers/grub-16x9.png  /usr/share/desktop-base/active-theme/grub/
cp customization/wallpapers/grub-4x3.png  /usr/share/desktop-base/active-theme/grub/

# Personalizamos el lightdm

# Borramos el archivo 01_debian.conf con un echo vacio.
echo "" > /usr/share/lightdm/lightdm-gtk-greeter.conf.d/01_debian.conf

# Creamos una variable donde ponemos las configuraciones en un string
lightdm="
# Debian specific defaults

[greeter]
#background=/usr/share/images/desktop-base/login-background.svg
background=/usr/share/backgrounds/wallpapers/tuxito.png
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

echo "La instalación esta por terminar debe configurar el nombre de usuario"

loop=true

while $loop ; do
    echo "Ingrese el nombre de usuario que creo en la instalación:"
    read nameuser1

    echo "Vuelva a repetir en nombre de usuario:"
    read nameuser2

    if [ "$nameuser1" == "$nameuser2" ]; then
        echo "¿Esta seguro que este fue el nombre de usuario que ha creado en la instalación?"
        echo "Presione -y- para confirmar o cualquier tecla para volver a introducir"
        read t
        case $t in 
            "y")
                user="$nameuser1"
                break
                ;;
            *)
                echo "Volviendo al menu"
                ;; 
        esac
    else
        echo "Los nombres de usuarios no coinciden, vuelva a intentarlo"
    fi
done    

# Agregamos nuestro usuario al archivo sudores

echo "# Damos privilegios de sudo a nuestro usuario" >> /etc/sudoers
echo "$user  ALL=(ALL:ALL) ALL" >> /etc/sudoers 

# Copiamos toda la configuracion del usuario root al usuario que creamos
cp -r /root/.config/ /home/$user   

# Cambiar los permisos de usuario
chown -R $user:$user /home/$user/.config

# Agregar al PATH las rutas del sistema para el usuario que creamos instalacion
echo "export PATH=$PATH:/bin:/usr/bin:/sbin:/usr/sbin" >> /home/$user/.bashrc
source /home/$user/.bashrc  

# Habilitamos el firewall
ufw enable

# Actualizamos el grub
update-grub

# Actualizo el sistema y reinicio
updates
reboot
