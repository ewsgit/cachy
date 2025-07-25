#!/bin/bash

# Copyright (C) 2025 Ewsgit<ewsgit@ewsgit.uk>

echo "Performing post-installation steps for Ewsgit's CachyOS configuration."

if [ "$(pwd)" != "$HOME/cachy" ]; then
    echo "Error: You should be in the ~/cachy directory."
    exit 1
else
    echo "You are in the ~/cachy directory. Continuing with the rest of the script..."
fi

echo "Please ensure github's ssh key is setup before running this script"

# Arch Repository & AUR

echo "----- Sync package repositories"
paru -Syu

echo "----- Installing Ghostty (terminal)"
paru --noconfirm -S ghostty

echo "----- Installing OCS-url (Pling.com theming installer integration)"
paru --noconfirm -S ocs-url

echo "----- Installing Steam (game store)"
paru --noconfirm -S steam

echo "----- Installing Lutris (linux games WINE manager)"
paru --noconfirm -S lutris

echo "----- Installing Discord (communication platform)"
paru --noconfirm -S discord

echo "----- Installing Vesktop (vencord desktop)"
paru --noconfirm -S vesktop

echo "----- Installing Visual Studio Code (code editor)"
paru --noconfirm -S visual-studio-code-bin

echo "----- Installing Figma (design tool)"
paru --noconfirm -S figma-linux

echo "----- Installing ProtonPlus (Linux gaming compatibility layer installation manager)"
paru --noconfirm -S protonplus

echo "----- Installing GIMP (Photo editor)"
paru --noconfirm -S gimp

echo "----- Installing Blender (3D modelling)"
paru --noconfirm -S blender

echo "----- Installing Eza (ls replacement)"
paru --noconfirm -S eza

echo "----- Installing Resources (System activity monitor)"
paru --noconfirm -S resources

echo "----- Installing Obsidian (note-taking)"
paru --noconfirm -S obsidian

echo "----- Installing Extension Manager (Gnome shell extensions manager)"
paru --noconfirm -S extension-manager

echo "----- Installing Gnome Software (Application flatpak store & application manager)"
paru --noconfirm -S gnome-software

echo "----- Installing MS win11 Fonts (General multipurpose fonts)"
paru --noconfirm -S ttf-ms-win11-auto

echo "----- Installing Jetbrains Toolbox (Jetbrains tools management)"
paru --noconfirm -S jetbrains-toolbox

echo "----- Installing Zed (Code editor)"
paru --noconfirm -S zed

echo "----- Installing Programming fonts (General programming fonts)"
paru --noconfirm -S ttf-jetbrains-mono ttf-jetbrains-mono-nerd ttf-iosevka-nerd ttf-meslo-nerd ttf-fira-code ttf-space-mono-nerd ttf-zed-mono-nerd

echo "----- Installing Neovim (Code editor)"
paru --noconfirm -S neovim

echo "----- Installing Modrinth (Minecraft Mod loader)"
paru --noconfirm -S modrinth-app-bin

echo "----- Installing Thunderbird"
paru --noconfirm -S thunderbird

echo "----- Installing Spotify"
paru --noconfirm -S spotify

# Flatpak

echo "----- Installing Parabolic (Online video downloader)"
flatpak install flathub org.nickvision.tubeconverter

echo "----- Installing Cartridges (Game launcher)"
flatpak install flathub page.kramo.Cartridges

echo "----- Installing Showtime (Video player)"
flatpak install flathub org.gnome.Showtime

echo "----- Installing Maps (Mapping and Navigation)"
flatpak install flathub org.gnome.Maps

echo "----- Installing Sober (Roblox on linux)"
flatpak install flathub org.vinegarhq.Sober 

# Bun Runtime

echo "----- Installing Bun"
curl -fsSL https://bun.sh/install | bash

# Directory Creation

mkdir ~/Projects
mkdir ~/.themeRepos

# Install themes

echo "----- Installing gtk & libadwaita theme"
cd ~/.themeRepos || exit
git clone git@github.com:vinceliuice/MacTahoe-gtk-theme.git

cd ~/.themeRepos/MacTahoe-gtk-theme || exit

./install.sh -t pink -o solid
./install.sh -l -t pink -o solid

echo "----- Installing icon theme"
cd ~/.themeRepos || exit
git clone git@github.com:vinceliuice/MacTahoe-icon-theme.git

cd ~/.themeRepos/MacTahoe-icon-theme || exit

./install.sh -t pink -b

echo "----- Installing cursor theme"
mkdir ~/.icons
cp ~/cachy/assets/MacOS-Tahoe-Cursor -r ~/.icons/

# Install Oh My Zsh

echo "----- Installing Oh My Zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "----- Installing NVM (Node version manager)"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

echo "----- Installing NVChad"
git clone https://github.com/NvChad/starter ~/.config/nvim
