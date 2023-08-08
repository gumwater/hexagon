#!/usr/bin/env bash


# Default packages are for the configuration and corresponding .config folders
# Install packages after installing base Debian with no GUI

# xorg display server installation
sudo apt install -y xorg xbacklight xbindkeys xvkbd xinput

# PACKAGE INCLUDES build-essential.
sudo apt install -y build-essential

# Create folders in user directory (eg. Documents,Downloads,etc.)
xdg-user-dirs-update

# Installation of i3 Windows Manager
sudo apt install -y i3-wm suckless-tools sxhkd polybar

# XFCE4 Minimal
# sudo apt install -y xfce4 xfce4-goodies

# Network File Tools/System Events
sudo apt install -y dialog mtools dosfstools avahi-daemon acpi acpid gvfs-backends xfce4-power-manager

sudo systemctl enable avahi-daemon
sudo systemctl enable acpid

# Networking etc
sudo apt install -y policykit-1-gnome network-manager network-manager-gnome

# Thunar
sudo apt install -y thunar thunar-archive-plugin thunar-volman file-roller

# Terminal (eg. terminator,kitty,xfce4-terminal)
sudo apt install -y tilix kitty

# Sound packages (pipewire needs testing)
sudo apt install -y pipewire pulseaudio alsa-utils pavucontrol volumeicon-alsa pamixer

# Neofetch
sudo apt install -y neofetch

# Installation for Appearance management
sudo apt install -y lxappearance 

# Browser Installation (eg. chromium)
sudo apt install curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install -y brave-browser

# Desktop background browser/handler 
# feh --bg-fill /path/to/directory 
# sudo apt install -y nitrogen 
sudo apt install -y feh
 
# Fonts and icons for now
sudo apt install -y fonts-recommended fonts-ubuntu fonts-font-awesome fonts-terminus

# EXA installation
# replace ls command in .bashrc file with line below
# alias ls='exa -al --long --header --color=always --group-directories-first' 
sudo apt install -y exa

# Printing and bluetooth (if needed)
# sudo apt install -y cups system-config-printer simple-scan
# sudo apt install -y bluez blueman

# sudo systemctl enable cups
# sudo systemctl enable bluetooth

# Packages needed for window manager installation
sudo apt install -y picom rofi dunst libnotify-bin unzip 

# my favs
# sudo apt install -y numlockx geany geany-plugin-addons geany-plugin-git-changebar geany-plugin-overview geany-plugin-spellcheck geany-plugin-treebrowser geany-plugin-vimode scrot evince pdfarranger transmission-gtk gimp obs-studio mkvtoolnix-gui
# sudo apt install -y mpv figlet qimgv l3afpad galculator redshift cpu-x galculator ghostwriter udns-utils whois curl

# Install Lightdm Console Display Manager
sudo apt install -y lightdm lightdm-gtk-greeter-settings
sudo systemctl enable lightdm

########################################################
# End of script for default config
#

# cp new /usr/share/X11/xorg.conf.d/40-libinput.conf from repository to /usr/share/X11/xorg.conf.d/ for trackpad tap setting
sudo cp ./config/40-libinput.conf /usr/share/X11/xorg.conf.d/

## These two scripts will install nerdfonts and copy my configuration files into the ~/.config directory
## Configuration uses 

sudo apt install unzip -y

mkdir -p ~/.local/share/fonts

cd /tmp
fonts=( 
"CascadiaCode"
"FiraCode" 
"Go-Mono" 
"Hack"  
"JetBrainsMono" 
"Meslo"
"Mononoki" 
"RobotoMono" 
"SourceCodePro" 
"UbuntuMono"
)

for font in ${fonts[@]}
do
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/$font.zip
	unzip $font.zip -d $HOME/.local/share/fonts/$font/
    rm $font.zip
done
fc-cache

sudo apt autoremove

printf "\e[1;32mYou can now reboot! Thanks you.\e[0m\n"
