#!/bin/sh
############  CrowdRocker Linux Dotfiles ###################
# CrowdRocker Linux Dotfiles
# My personal dotfiles including swayfx

sudo pacman -Sy archlinux-keyring && sudo pacman -Syyu

# enable flatpaks
sudo pacman -S --noconfirm --needed flatpak

###### yay ########
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd


### cachyos-repo
wget https://mirror.cachyos.org/cachyos-repo.tar.xz
tar xvf cachyos-repo.tar.xz && cd cachyos-repo
sudo ./cachyos-repo.sh

# Add cachyos-repo
if ! grep -q "^\[cachyos\]" /etc/pacman.conf; then
  echo "[cachyos]
Include = /etc/pacman.d/cachyos-mirrorlist" | sudo tee -a /etc/pacman.conf
  sudo pacman -Sy
  echo "cachyos-repo repository added/updated successfully"
fi

### chaotic-aur
# Add chaotic AUR keys and repository if not added, else skip
echo "Adding chaotic AUR keys and repository"
if ! pacman-key --list-keys chaotic-aur &> /dev/null; then
  echo "Adding chaotic AUR keys and repository"
  sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
  sudo pacman-key --lsign-key 3056513887B78AEB
  sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
  sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
  echo "Chaotic AUR keys added successfully"
else 
  echo "Chaotic AUR keys and repository already added. Skipping..."
fi

# Add chaotic AUR
if ! grep -q "^\[chaotic-aur\]" /etc/pacman.conf; then
  echo "[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf
  sudo pacman -Sy
  echo "Chaotic AUR repository added/updated successfully"
fi


###### lightdm ########
###yay -S --noconfirm --needed lightdm
###yay -S --noconfirm --needed lightdm-gtk-greeter
###yay -S --noconfirm --needed lightdm-settings
###yay -S --noconfirm --needed lightdm-slick-greeter
###sudo systemctl enable lightdm.service

###### sddm ########
yay -S --needed qt5-graphicaleffects qt5-quickcontrols2 qt5-svg sddm
sudo git clone https://github.com/keyitdev/sddm-flower-theme.git /usr/share/sddm/themes/sddm-flower-theme
sudo cp /usr/share/sddm/themes/sddm-flower-theme/Fonts/* /usr/share/fonts/
echo "[Theme]
Current=sddm-flower-theme" | sudo tee /etc/sddm.conf
sudo systemctl enable sddm.service

###### Packages ########     

yay -S --noconfirm --needed Azote
yay -S --noconfirm --needed abiword
yay -S --noconfirm --needed acpi
yay -S --noconfirm --needed alacritty
yay -S --noconfirm --needed alacritty-themes
yay -S --noconfirm --needed alsa-firmware
yay -S --noconfirm --needed alsa-utils
yay -S --noconfirm --needed amd-ucode
yay -S --noconfirm --needed appimagelauncher
yay -S --noconfirm --needed appmenu-gtk-module
yay -S --noconfirm --needed appstream-glib
yay -S --noconfirm --needed appstream-qt5
yay -S --noconfirm --needed arandr
yay -S --noconfirm --needed arc-gtk-theme-eos
yay -S --noconfirm --needed arc-x-icons-theme
yay -S --noconfirm --needed arch-gaming-meta
yay -S --noconfirm --needed arch-install-scripts
yay -S --noconfirm --needed arch-update
yay -S --noconfirm --needed archlinux-tweak-tool-git
yay -S --noconfirm --needed archlinux-xdg-menu
yay -S --noconfirm --needed ardour
yay -S --noconfirm --needed aria2
yay -S --noconfirm --needed arj
yay -S --noconfirm --needed aspell
yay -S --noconfirm --needed atril
yay -S --noconfirm --needed audacious
yay -S --noconfirm --needed audacity
yay -S --noconfirm --needed autorandr
yay -S --noconfirm --needed autotiling
yay -S --noconfirm --needed awesome-terminal-fonts
yay -S --noconfirm --needed aylurs-gtk-shell
yay -S --noconfirm --needed azote
yay -S --noconfirm --needed b43-fwcutter
yay -S --noconfirm --needed baka-mplayer
yay -S --noconfirm --needed baobab
yay -S --noconfirm --needed base
yay -S --noconfirm --needed base-devel
yay -S --noconfirm --needed base16-alacritty-git
yay -S --noconfirm --needed bash-completion
yay -S --noconfirm --needed bat
yay -S --noconfirm --needed beautyline
yay -S --noconfirm --needed bibata-cursor-theme
yay -S --noconfirm --needed bibata-cursor-translucent
yay -S --noconfirm --needed bibata-extra-cursor-theme
yay -S --noconfirm --needed bibata-rainbow-cursor-theme
yay -S --noconfirm --needed bind
yay -S --noconfirm --needed bleachbit
yay -S --noconfirm --needed blender
yay -S --noconfirm --needed boost
yay -S --noconfirm --needed bottles
yay -S --noconfirm --needed boxtron
yay -S --noconfirm --needed brave-bin
yay -S --noconfirm --needed bridge-utils
yay -S --noconfirm --needed brightnessctl
yay -S --noconfirm --needed brltty
yay -S --noconfirm --needed broadcom-wl-dkms
yay -S --noconfirm --needed btop
yay -S --noconfirm --needed btrfs-assistant
yay -S --noconfirm --needed btrfs-du
yay -S --noconfirm --needed btrfs-progs
yay -S --noconfirm --needed btrfsmaintenance
yay -S --noconfirm --needed calf
yay -S --noconfirm --needed capitaine-cursors
yay -S --noconfirm --needed carla
yay -S --noconfirm --needed cava
yay -S --noconfirm --needed celluloid
yay -S --noconfirm --needed chezmoi
yay -S --noconfirm --needed chiaki
yay -S --noconfirm --needed clapper
yay -S --noconfirm --needed cliphist
yay -S --noconfirm --needed clipman
yay -S --noconfirm --needed clonezilla
yay -S --noconfirm --needed cloud-init
yay -S --noconfirm --needed codeblocks
yay -S --noconfirm --needed cpuid
yay -S --noconfirm --needed cpupower
yay -S --noconfirm --needed cups
yay -S --noconfirm --needed cups-browsed
yay -S --noconfirm --needed cups-pdf
yay -S --noconfirm --needed cups-pk-helper
yay -S --noconfirm --needed curlftpfs
yay -S --noconfirm --needed darkhttpd
yay -S --noconfirm --needed darktable
yay -S --noconfirm --needed dart-sass
yay -S --noconfirm --needed ddrescue
yay -S --noconfirm --needed deluge
yay -S --noconfirm --needed deluge-gtk
yay -S --noconfirm --needed dex
yay -S --noconfirm --needed dhcpcd
yay -S --noconfirm --needed dialog
yay -S --noconfirm --needed discord
yay -S --noconfirm --needed dmenu
yay -S --noconfirm --needed dmidecode
yay -S --noconfirm --needed dmraid
yay -S --noconfirm --needed dnsmasq
yay -S --noconfirm --needed docker
yay -S --noconfirm --needed docker-compose
yay -S --noconfirm --needed dotnet-runtime
yay -S --noconfirm --needed downgrade
yay -S --noconfirm --needed dracula-cursors-git
yay -S --noconfirm --needed dracula-gtk-theme-git
yay -S --noconfirm --needed dracula-icons-git
yay -S --noconfirm --needed dracut
yay -S --noconfirm --needed duf
yay -S --noconfirm --needed dunst
yay -S --noconfirm --needed dvgrab
yay -S --noconfirm --needed easyeffects
yay -S --noconfirm --needed edid-decode-git
yay -S --noconfirm --needed edk2-shell
yay -S --noconfirm --needed efibootmgr
yay -S --noconfirm --needed efitools
yay -S --noconfirm --needed egl-wayland
yay -S --noconfirm --needed emacs
yay -S --noconfirm --needed endeavouros-xfce4-terminal-colors
yay -S --noconfirm --needed engrampa
yay -S --noconfirm --needed eos-skel-ce-xfcei3
yay -S --noconfirm --needed epiphany
yay -S --noconfirm --needed espeakup
yay -S --noconfirm --needed ethtool
yay -S --noconfirm --needed evince
yay -S --noconfirm --needed exfatprogs
yay -S --noconfirm --needed exo
yay -S --noconfirm --needed eza
yay -S --noconfirm --needed f2fs-tools
yay -S --noconfirm --needed fail2ban
yay -S --noconfirm --needed fastfetch
yay -S --noconfirm --needed fatresize
yay -S --noconfirm --needed feh
yay -S --noconfirm --needed festival
yay -S --noconfirm --needed ffmpegthumbnailer
yay -S --noconfirm --needed file-roller
yay -S --noconfirm --needed filezilla
yay -S --noconfirm --needed find-the-command
yay -S --noconfirm --needed firejail
yay -S --noconfirm --needed firewalld
yay -S --noconfirm --needed fish
yay -S --noconfirm --needed flameshot-git
yay -S --noconfirm --needed flat-remix-git
yay -S --noconfirm --needed flatpak
yay -S --noconfirm --needed flavours
yay -S --noconfirm --needed fluent-gtk-theme-git
yay -S --noconfirm --needed foomatic-db
yay -S --noconfirm --needed foomatic-db-engine
yay -S --noconfirm --needed foomatic-db-gutenprint-ppds
yay -S --noconfirm --needed foomatic-db-nonfree
yay -S --noconfirm --needed foomatic-db-nonfree-ppds
yay -S --noconfirm --needed foomatic-db-ppds
yay -S --noconfirm --needed foot
yay -S --noconfirm --needed fpc
yay -S --noconfirm --needed fsarchiver
yay -S --noconfirm --needed fscrypt
yay -S --noconfirm --needed fsearch
yay -S --noconfirm --needed fuse2fs
yay -S --noconfirm --needed fuzzel
yay -S --noconfirm --needed fwupd
yay -S --noconfirm --needed galculator
yay -S --noconfirm --needed garcon
yay -S --noconfirm --needed gcolor3
yay -S --noconfirm --needed geany
yay -S --noconfirm --needed geany-plugins
yay -S --noconfirm --needed geary
yay -S --noconfirm --needed gedit
yay -S --noconfirm --needed geekbench
yay -S --noconfirm --needed gestures
yay -S --noconfirm --needed gimp
yay -S --noconfirm --needed git
yay -S --noconfirm --needed gitahead-git
yay -S --noconfirm --needed gitfiend
yay -S --noconfirm --needed gitg
yay -S --noconfirm --needed github-cli
yay -S --noconfirm --needed github-desktop
yay -S --noconfirm --needed gitkraken
yay -S --noconfirm --needed gksu
yay -S --noconfirm --needed glances
yay -S --noconfirm --needed glava
yay -S --noconfirm --needed gmtp
yay -S --noconfirm --needed gnome-disk-utility
yay -S --noconfirm --needed google-chrome
yay -S --noconfirm --needed gopsuinfo
yay -S --noconfirm --needed gpart
yay -S --noconfirm --needed gparted
yay -S --noconfirm --needed gpu-screen-recorder-git
yay -S --noconfirm --needed graphite-gtk-theme-git
yay -S --noconfirm --needed greetd
yay -S --noconfirm --needed greetd-regreet
yay -S --noconfirm --needed grilo-plugins
yay -S --noconfirm --needed grim
yay -S --noconfirm --needed grub
yay -S --noconfirm --needed grub-btrfs
yay -S --noconfirm --needed gsimplecal
yay -S --noconfirm --needed gst-libav
yay -S --noconfirm --needed gst-plugin-pipewire
yay -S --noconfirm --needed gstreamer-meta
yay -S --noconfirm --needed gthumb
yay -S --noconfirm --needed gtk-engine-murrine
yay -S --noconfirm --needed gtk-layer-shell
yay -S --noconfirm --needed gtkhash
yay -S --noconfirm --needed gtklock
yay -S --noconfirm --needed gtklock-playerctl-module
yay -S --noconfirm --needed gtklock-powerbar-module
yay -S --noconfirm --needed gtklock-userinfo-module
yay -S --noconfirm --needed gufw
yay -S --noconfirm --needed gutenprint
yay -S --noconfirm --needed gvfs
yay -S --noconfirm --needed gvfs-afc
yay -S --noconfirm --needed gvfs-dnssd
yay -S --noconfirm --needed gvfs-goa
yay -S --noconfirm --needed gvfs-google
yay -S --noconfirm --needed gvfs-gphoto2
yay -S --noconfirm --needed gvfs-mtp
yay -S --noconfirm --needed gvfs-nfs
yay -S --noconfirm --needed gvfs-onedrive
yay -S --noconfirm --needed gvfs-smb
yay -S --noconfirm --needed gvfs-wsdd
yay -S --noconfirm --needed hardinfo2
yay -S --noconfirm --needed haveged
yay -S --noconfirm --needed hdparm
yay -S --noconfirm --needed heroic-games-launcher-bin
yay -S --noconfirm --needed hexchat
yay -S --noconfirm --needed hplip
yay -S --noconfirm --needed htop
yay -S --noconfirm --needed hunspell-fr
yay -S --noconfirm --needed hw-probe
yay -S --noconfirm --needed hwdetect
yay -S --noconfirm --needed iftop
yay -S --noconfirm --needed ifuse
yay -S --noconfirm --needed imv
yay -S --noconfirm --needed inetutils
yay -S --noconfirm --needed inkscape
yay -S --noconfirm --needed intel-media-driver
yay -S --noconfirm --needed intel-ucode
yay -S --noconfirm --needed inxi
yay -S --noconfirm --needed irssi
yay -S --noconfirm --needed iw
yay -S --noconfirm --needed iwd
yay -S --noconfirm --needed jacktrip
yay -S --noconfirm --needed jfsutils
yay -S --noconfirm --needed jq
yay -S --noconfirm --needed jre8-openjdk
yay -S --noconfirm --needed kanshi
yay -S --noconfirm --needed kate
yay -S --noconfirm --needed kazam
yay -S --noconfirm --needed kitty
yay -S --noconfirm --needed konsole
yay -S --noconfirm --needed kooha
yay -S --noconfirm --needed krita
yay -S --noconfirm --needed krita-plugin-gmic
yay -S --noconfirm --needed kvantum
yay -S --noconfirm --needed kvantum-theme-materia
yay -S --noconfirm --needed kvantum-theme-qogir-git
yay -S --noconfirm --needed languagetool
yay -S --noconfirm --needed layan-gtk-theme-git
yay -S --noconfirm --needed lazygit
yay -S --noconfirm --needed ldns
yay -S --noconfirm --needed leafpad
yay -S --noconfirm --needed less
yay -S --noconfirm --needed lftp
yay -S --noconfirm --needed lhasa
yay -S --noconfirm --needed lib32-mesa-vdpau
yay -S --noconfirm --needed lib32-pipewire-jack
yay -S --noconfirm --needed lib32-vulkan-mesa-layers
yay -S --noconfirm --needed lib32-vulkan-radeon
yay -S --noconfirm --needed libdvdcss
yay -S --noconfirm --needed libfido2
yay -S --noconfirm --needed libmythes
yay -S --noconfirm --needed libopenraw
yay -S --noconfirm --needed libpulse
yay -S --noconfirm --needed libreoffice-fresh
yay -S --noconfirm --needed libva-intel-driver
yay -S --noconfirm --needed light
yay -S --noconfirm --needed linux
yay -S --noconfirm --needed linux-atm
yay -S --noconfirm --needed linux-firmware
yay -S --noconfirm --needed linux-firmware-marvell
yay -S --noconfirm --needed linux-headers
yay -S --noconfirm --needed linux-zen
yay -S --noconfirm --needed linux-zen-headers
yay -S --noconfirm --needed livecd-sounds
yay -S --noconfirm --needed lmms
yay -S --noconfirm --needed logrotate
yay -S --noconfirm --needed lolcat
yay -S --noconfirm --needed loupe
yay -S --noconfirm --needed lsd
yay -S --noconfirm --needed lshw
yay -S --noconfirm --needed lsp-plugins-lv2
yay -S --noconfirm --needed lsscsi
yay -S --noconfirm --needed luarocks
yay -S --noconfirm --needed lvm2
yay -S --noconfirm --needed lxappearance
yay -S --noconfirm --needed lxmusic
yay -S --noconfirm --needed lynx
yay -S --noconfirm --needed lzip
yay -S --noconfirm --needed mako
yay -S --noconfirm --needed malcontent
yay -S --noconfirm --needed man-db
yay -S --noconfirm --needed man-pages
yay -S --noconfirm --needed materia-gtk-theme
yay -S --noconfirm --needed mc
yay -S --noconfirm --needed mcfly
yay -S --noconfirm --needed mda.lv2
yay -S --noconfirm --needed megasync-bin
yay -S --noconfirm --needed meld
yay -S --noconfirm --needed memtest86+
yay -S --noconfirm --needed memtest86+-efi
yay -S --noconfirm --needed menulibre
yay -S --noconfirm --needed micro
yay -S --noconfirm --needed mintstick
yay -S --noconfirm --needed mission-center
yay -S --noconfirm --needed mixxx
yay -S --noconfirm --needed mkinitcpio-archiso
yay -S --noconfirm --needed mkinitcpio-firmware
yay -S --noconfirm --needed mkinitcpio-nfs-utils
yay -S --noconfirm --needed modem-manager-gui
yay -S --noconfirm --needed most
yay -S --noconfirm --needed mousepad
yay -S --noconfirm --needed mousetweaks
yay -S --noconfirm --needed movit
yay -S --noconfirm --needed mpc
yay -S --noconfirm --needed mpd
yay -S --noconfirm --needed mpv-mpris
yay -S --noconfirm --needed mtools
yay -S --noconfirm --needed mtpfs
yay -S --noconfirm --needed mugshot
yay -S --noconfirm --needed muse
yay -S --noconfirm --needed mystiq
yay -S --noconfirm --needed mythes-en
yay -S --noconfirm --needed nano
yay -S --noconfirm --needed nano-syntax-highlighting
yay -S --noconfirm --needed navi
yay -S --noconfirm --needed nbd
yay -S --noconfirm --needed ncmpcpp
yay -S --noconfirm --needed ndisc6
yay -S --noconfirm --needed neofetch
yay -S --noconfirm --needed neovim
yay -S --noconfirm --needed netctl
yay -S --noconfirm --needed network-manager-applet
yay -S --noconfirm --needed networkmanager
yay -S --noconfirm --needed networkmanager-openconnect
yay -S --noconfirm --needed networkmanager-openvpn
yay -S --noconfirm --needed networkmanager-pptp
yay -S --noconfirm --needed newsboat
yay -S --noconfirm --needed nfs-utils
yay -S --noconfirm --needed nitrogen
yay -S --noconfirm --needed nlohmann-json
yay -S --noconfirm --needed nmap
yay -S --noconfirm --needed nss-mdns
yay -S --noconfirm --needed ntfs-3g
yay -S --noconfirm --needed ntp
yay -S --noconfirm --needed numix-gtk-theme-git
yay -S --noconfirm --needed numlockx
yay -S --noconfirm --needed nvme-cli
yay -S --noconfirm --needed nvtop
yay -S --noconfirm --needed nwg-bar
yay -S --noconfirm --needed nwg-clipman
yay -S --noconfirm --needed nwg-displays
yay -S --noconfirm --needed nwg-dock
yay -S --noconfirm --needed nwg-drawer
yay -S --noconfirm --needed nwg-hello
yay -S --noconfirm --needed nwg-icon-picker
yay -S --noconfirm --needed nwg-look
yay -S --noconfirm --needed nwg-menu
yay -S --noconfirm --needed nwg-panel
yay -S --noconfirm --needed nwg-readme-browser
yay -S --noconfirm --needed obs-studio
yay -S --noconfirm --needed obsidian
yay -S --noconfirm --needed obsidian-icon-theme
yay -S --noconfirm --needed octopi
yay -S --noconfirm --needed oh-my-posh-bin
yay -S --noconfirm --needed oh-my-zsh-powerline-theme-git
yay -S --noconfirm --needed open-iscsi
yay -S --noconfirm --needed open-vm-tools
yay -S --noconfirm --needed openrgb
yay -S --noconfirm --needed openshot
yay -S --noconfirm --needed opentimelineio
yay -S --noconfirm --needed opus-tools
yay -S --noconfirm --needed orca
yay -S --noconfirm --needed os-prober
yay -S --noconfirm --needed pace
yay -S --noconfirm --needed pacseek
yay -S --noconfirm --needed pamac-aur
yay -S --noconfirm --needed pamixer
yay -S --noconfirm --needed papirus-icon-theme
yay -S --noconfirm --needed parole
yay -S --noconfirm --needed paru
yay -S --noconfirm --needed pavucontrol
yay -S --noconfirm --needed pdfarranger
yay -S --noconfirm --needed peek
yay -S --noconfirm --needed perl-file-mimeinfo
yay -S --noconfirm --needed pev
yay -S --noconfirm --needed picom
yay -S --noconfirm --needed pikaur-git
yay -S --noconfirm --needed pinta
yay -S --noconfirm --needed piper
yay -S --noconfirm --needed pipewire
yay -S --noconfirm --needed pipewire-alsa
yay -S --noconfirm --needed pipewire-jack
yay -S --noconfirm --needed pipewire-pulse
yay -S --noconfirm --needed pipewire-support
yay -S --noconfirm --needed pitivi
yay -S --noconfirm --needed pkgfile
yay -S --noconfirm --needed playonlinux
yay -S --noconfirm --needed plocate
yay -S --noconfirm --needed pokemon-colorscripts-git
yay -S --noconfirm --needed polkit-gnome
yay -S --noconfirm --needed polybar
yay -S --noconfirm --needed power-profiles-daemon
yay -S --noconfirm --needed powerpill
yay -S --noconfirm --needed powertop
yay -S --noconfirm --needed printer-support
yay -S --noconfirm --needed protonup-qt
yay -S --noconfirm --needed pulsemixer
yay -S --noconfirm --needed putty
yay -S --noconfirm --needed pv
yay -S --noconfirm --needed python-pip
yay -S --noconfirm --needed python-pyquery
yay -S --noconfirm --needed python-pywal
yay -S --noconfirm --needed python-ttkbootstrap
yay -S --noconfirm --needed qalculate-gtk
yay -S --noconfirm --needed qbittorrent
yay -S --noconfirm --needed qemu-guest-agent
yay -S --noconfirm --needed qogir-gtk-theme-git
yay -S --noconfirm --needed qpdfview
yay -S --noconfirm --needed qpwgraph
yay -S --noconfirm --needed qsynth
yay -S --noconfirm --needed qt5-3d
yay -S --noconfirm --needed qt5-charts
yay -S --noconfirm --needed qt5-connectivity
yay -S --noconfirm --needed qt5-datavis3d
yay -S --noconfirm --needed qt5-doc
yay -S --noconfirm --needed qt5-examples
yay -S --noconfirm --needed qt5-imageformats
yay -S --noconfirm --needed qt5-networkauth
yay -S --noconfirm --needed qt5-quick3d
yay -S --noconfirm --needed qt5-remoteobjects
yay -S --noconfirm --needed qt5-scxml
yay -S --noconfirm --needed qt5-sensors
yay -S --noconfirm --needed qt5-serialport
yay -S --noconfirm --needed qt5-websockets
yay -S --noconfirm --needed qt5ct
yay -S --noconfirm --needed qt6ct
yay -S --noconfirm --needed qtcreator
yay -S --noconfirm --needed qtractor
yay -S --noconfirm --needed r
yay -S --noconfirm --needed ranger
yay -S --noconfirm --needed rate-mirrors-bin
yay -S --noconfirm --needed rebuild-detector
yay -S --noconfirm --needed redshift
yay -S --noconfirm --needed refind
yay -S --noconfirm --needed reflector
yay -S --noconfirm --needed reflector-simple
yay -S --noconfirm --needed reiserfsprogs
yay -S --noconfirm --needed replay-sorcery
yay -S --noconfirm --needed retroarch
yay -S --noconfirm --needed ripgrep-all
yay -S --noconfirm --needed ristretto
yay -S --noconfirm --needed rocm-hip-runtime
yay -S --noconfirm --needed rocm-opencl-runtime
yay -S --noconfirm --needed rofi
yay -S --noconfirm --needed rsync
yay -S --noconfirm --needed rtl8821cu-morrownr-dkms-git
yay -S --noconfirm --needed rygel
yay -S --noconfirm --needed s-nail
yay -S --noconfirm --needed sane
yay -S --noconfirm --needed sardi-icons
yay -S --noconfirm --needed scanner-support
yay -S --noconfirm --needed scrot
yay -S --noconfirm --needed scummvm
yay -S --noconfirm --needed sdparm
yay -S --noconfirm --needed sg3_utils
yay -S --noconfirm --needed shairport-sync
yay -S --noconfirm --needed shotwell
yay -S --noconfirm --needed simple-scan
yay -S --noconfirm --needed simplescreenrecorder
yay -S --noconfirm --needed slurp
yay -S --noconfirm --needed smartmontools
yay -S --noconfirm --needed smplayer
yay -S --noconfirm --needed smplayer-skins
yay -S --noconfirm --needed smplayer-themes
yay -S --noconfirm --needed snapd
yay -S --noconfirm --needed snapper-tools
yay -S --noconfirm --needed snapshot
yay -S --noconfirm --needed sofirem-git
yay -S --noconfirm --needed sparklines-git
yay -S --noconfirm --needed spotify
yay -S --noconfirm --needed spotify-launcher
yay -S --noconfirm --needed starship
yay -S --noconfirm --needed strace
yay -S --noconfirm --needed streamlink-twitch-gui-bin
yay -S --noconfirm --needed sublime-text-4
yay -S --noconfirm --needed surfn-icons-git
yay -S --noconfirm --needed sushi
yay -S --noconfirm --needed swappy
yay -S --noconfirm --needed swayfx
yay -S --noconfirm --needed sway-contrib
yay -S --noconfirm --needed swaybg
yay -S --noconfirm --needed swayidle
yay -S --noconfirm --needed swaylock
yay -S --noconfirm --needed swaync
yay -S --noconfirm --needed sweet-gtk-theme-dark
yay -S --noconfirm --needed swww
yay -S --noconfirm --needed syslinux
yay -S --noconfirm --needed sysstat
yay -S --noconfirm --needed systemd-ui
yay -S --noconfirm --needed task
yay -S --noconfirm --needed tcpdump
yay -S --noconfirm --needed tecla
yay -S --noconfirm --needed testdisk
yay -S --noconfirm --needed the_silver_searcher
yay -S --noconfirm --needed thefuck
yay -S --noconfirm --needed thunar
yay -S --noconfirm --needed thunar-archive-plugin
yay -S --noconfirm --needed thunar-media-tags-plugin
yay -S --noconfirm --needed thunar-volman
yay -S --noconfirm --needed thunderbird
yay -S --noconfirm --needed timeshift
yay -S --noconfirm --needed timeshift-autosnap
yay -S --noconfirm --needed tldr
yay -S --noconfirm --needed tmux
yay -S --noconfirm --needed tokyonight-gtk-theme-git
yay -S --noconfirm --needed totem
yay -S --noconfirm --needed traceroute
yay -S --noconfirm --needed translate-shell
yay -S --noconfirm --needed transmission-gtk
yay -S --noconfirm --needed tree
yay -S --noconfirm --needed trizen
yay -S --noconfirm --needed ttf-jetbrains-mono
yay -S --noconfirm --needed ttf-nerd-fonts-symbols
yay -S --noconfirm --needed ttf-ubuntu-font-family
yay -S --noconfirm --needed tumbler
yay -S --noconfirm --needed udftools
yay -S --noconfirm --needed udiskie
yay -S --noconfirm --needed ueberzug
yay -S --noconfirm --needed ufw
yay -S --noconfirm --needed ugrep
yay -S --noconfirm --needed unace
yay -S --noconfirm --needed unarchiver
yay -S --noconfirm --needed unarj
yay -S --noconfirm --needed unrar
yay -S --noconfirm --needed update-grub
yay -S --noconfirm --needed variety
yay -S --noconfirm --needed ventoy-bin
yay -S --noconfirm --needed veracrypt
yay -S --noconfirm --needed vi
yay -S --noconfirm --needed vim-airline
yay -S --noconfirm --needed vimix-cursors
yay -S --noconfirm --needed vimix-gtk-themes
yay -S --noconfirm --needed vimix-icon-theme
yay -S --noconfirm --needed visual-studio-code-bin
yay -S --noconfirm --needed vivaldi
yay -S --noconfirm --needed vkbasalt
yay -S --noconfirm --needed volumeicon
yay -S --noconfirm --needed vscodium
yay -S --noconfirm --needed vulkan-intel
yay -S --noconfirm --needed waybar
yay -S --noconfirm --needed wayland-protocols
yay -S --noconfirm --needed wget
yay -S --noconfirm --needed whitesur-icon-theme-git
yay -S --noconfirm --needed wine-installer
yay -S --noconfirm --needed wireless-regdb
yay -S --noconfirm --needed wireless_tools
yay -S --noconfirm --needed wireplumber
yay -S --noconfirm --needed wl-clipboard
yay -S --noconfirm --needed xarchiver
yay -S --noconfirm --needed xautolock
yay -S --noconfirm --needed xbindkeys
yay -S --noconfirm --needed xcape
yay -S --noconfirm --needed xclip
yay -S --noconfirm --needed xdg-desktop-portal-wlr
yay -S --noconfirm --needed xdg-desktop-portal-xapp
yay -S --noconfirm --needed xdg-user-dirs-gtk
yay -S --noconfirm --needed xdotool
yay -S --noconfirm --needed xed
yay -S --noconfirm --needed xf86-video-amdgpu
yay -S --noconfirm --needed xf86-video-ati
yay -S --noconfirm --needed xf86-video-nouveau
yay -S --noconfirm --needed xf86-video-vmware
yay -S --noconfirm --needed xorg-bdftopcf
yay -S --noconfirm --needed xorg-server-xephyr
yay -S --noconfirm --needed xorg-sessreg
yay -S --noconfirm --needed xorg-smproxy
yay -S --noconfirm --needed xorg-x11perf
yay -S --noconfirm --needed xorg-xbacklight
yay -S --noconfirm --needed xorg-xcmsdb
yay -S --noconfirm --needed xorg-xcursorgen
yay -S --noconfirm --needed xorg-xdpyinfo
yay -S --noconfirm --needed xorg-xdriinfo
yay -S --noconfirm --needed xorg-xev
yay -S --noconfirm --needed xorg-xgamma
yay -S --noconfirm --needed xorg-xhost
yay -S --noconfirm --needed xorg-xkbevd
yay -S --noconfirm --needed xorg-xkbprint
yay -S --noconfirm --needed xorg-xkbutils
yay -S --noconfirm --needed xorg-xkill
yay -S --noconfirm --needed xorg-xlsatoms
yay -S --noconfirm --needed xorg-xlsclients
yay -S --noconfirm --needed xorg-xpr
yay -S --noconfirm --needed xorg-xrefresh
yay -S --noconfirm --needed xorg-xvinfo
yay -S --noconfirm --needed xorg-xwayland
yay -S --noconfirm --needed xorg-xwd
yay -S --noconfirm --needed xorg-xwininfo
yay -S --noconfirm --needed xorg-xwud
yay -S --noconfirm --needed xpadneo-dkms-git
yay -S --noconfirm --needed xpdf
yay -S --noconfirm --needed xsel
yay -S --noconfirm --needed xsettingsd
yay -S --noconfirm --needed xss-lock
yay -S --noconfirm --needed yaru-icon-theme
yay -S --noconfirm --needed yay
yay -S --noconfirm --needed yazi
yay -S --noconfirm --needed yelp
yay -S --noconfirm --needed youtube-dl-gui-git
yay -S --noconfirm --needed yt-dlp
yay -S --noconfirm --needed yt-dlp-drop-in
yay -S --noconfirm --needed zam-plugins-lv2
yay -S --noconfirm --needed zathura
yay -S --noconfirm --needed zathura-cb
yay -S --noconfirm --needed zathura-djvu
yay -S --noconfirm --needed zathura-pdf-mupdf
yay -S --noconfirm --needed zathura-ps
yay -S --noconfirm --needed zoxide
yay -S --noconfirm --needed zram-generator
yay -S --noconfirm --needed zsh-completions
yay -S --noconfirm --needed zsh-history-substring-search
yay -S --noconfirm --needed zsh-syntax-highlighting


###### Firewall installs ####
sudo ufw enable
sudo ufw status verbose
sudo systemctl enable ufw.service
sudo systemctl enable fstrim.timer
sudo systemctl start fstrim.timer
du -sh /var/cache/pacman/pkg/
sudo pacman -S -y pacman-contrib
sudo systemctl enable paccache.timer

### update-grub

git clone https://aur.archlinux.org/update-grub.git
cd update-grub
makepkg -si
cd
sudo update-grub

###### Flatpaks installs ####
flatpak install flathub com.github.tchx84.Flatseal --assumeyes  --or-update --system
flatpak install flathub com.adobe.Flash-Player-Projector --assumeyes  --or-update --system
flatpak install flathub nz.mega.MEGAsync --assumeyes  --or-update --system
flatpak install flathub fr.natron.Natron --assumeyes  --or-update --system
flatpak install flathub com.protonvpn.www --assumeyes  --or-update --system
flatpak install flathub me.proton.Pass --assumeyes  --or-update --system
flatpak install flathub ua.org.brezblock.q4wine --assumeyes  --or-update --system
flatpak install flathub com.usebottles.bottles --assumeyes  --or-update --system
flatpak install flathub com.vysp3r.ProtonPlus --assumeyes  --or-update --system
flatpak install flathub com.github.Matoking.protontricks --assumeyes  --or-update --system

sudo pacman -Syyu && sudo pacman -Syu


# Install tools from list_tools.txt
while read -r tool; do
  yay -S --noconfirm --needed "$tool"
done < list_tools.txt

sudo pacman -Syu && sudo pacman -Scc && fc-cache -fv