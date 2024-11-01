#!/bin/bash

# Function to install yay if not already installed
install_yay() {
  if ! command -v yay >/dev/null 2>&1; then
    echo "yay is not installed. Installing yay first."

    # Install yay
    sudo pacman -S --noconfirm --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

    # Check if the installation was successful
    if ! command -v yay >/dev/null 2>&1; then
      echo "Error: Unable to install yay. Exiting."
      exit 1
    fi
  fi
}

# Function to prompt user for installation
ask_install() {
  read -rp "Do you want to install $1? (y/N): " response
  if [[ "$response" =~ ^[Yy]$ ]]; then
    yay -S --noconfirm "$1"
  else
    echo "$1 not installed."
  fi
}

# Check if the system is Arch Linux
if [ -f "/etc/arch-release" ]; then
  echo "System is Arch Linux."

  # Install yay if not already installed
  install_yay

else
  echo "Error: This script is intended for Arch Linux. Exiting."
  exit 1
fi

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

# Add cachyos AUR keys and repository if not added, else skip
echo "Adding chaotic AUR keys and repository"
if ! pacman-key --list-keys chaotic-aur &> /dev/null; then
  echo "Adding cachyos AUR keys and repository"
 # Import the repository key
sudo pacman-key --recv-keys F3B607488DB35A47 --keyserver keyserver.ubuntu.com
# Sign the repository key
sudo pacman-key --lsign-key F3B607488DB35A47
sudo pacman -U 'https://mirror.cachyos.org/repo/x86_64/cachyos/cachyos-keyring-20240331-1-any.pkg.tar.zst' \
'https://mirror.cachyos.org/repo/x86_64/cachyos/cachyos-mirrorlist-18-1-any.pkg.tar.zst' \
'https://mirror.cachyos.org/repo/x86_64/cachyos/cachyos-v3-mirrorlist-18-1-any.pkg.tar.zst' \
'https://mirror.cachyos.org/repo/x86_64/cachyos/cachyos-v4-mirrorlist-6-1-any.pkg.tar.zst' \
'https://mirror.cachyos.org/repo/x86_64/cachyos/pacman-7.0.0.r3.gf3211df-3.1-x86_64.pkg.tar.zst'
  echo "cachyos AUR keys added successfully"
else 
  echo "cachyos AUR keys and repository already added. Skipping..."
fi

# Add cachyos AUR
if ! grep -q "^\[cachyos\]" /etc/pacman.conf; then
  echo "[cachyos]
Include = /etc/pacman.d/cachyos-mirrorlist" | sudo tee -a /etc/pacman.conf
  sudo pacman -Sy
  echo "cachyos AUR repository added/updated successfully"
fi

# Install tools from list_tools.txt
while read -r tool; do
  yay -S --noconfirm --needed "$tool"
done < list_tools.txt

# Install optional tools with user confirmation
# while read -r optional_tool; do
#   ask_install "$optional_tool"
# done < optional_list_tools.txt

# Install NVM
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
# nvm install node
# nvm use node

# Check and install cargo (Rust)
# if ! command -v cargo >/dev/null 2>&1; then
#   echo "cargo is not installed. Installing cargo. RUSTUP!"
#   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# fi

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

sudo pacman -Syyu && sudo pacman -Syu
