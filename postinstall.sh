#!/bin/bash

# Copyright (C) 2025 Ewsgit<ewsgit@ewsgit.uk>

echo "Performing post-installation steps for Ewsgit's CachyOS configuration."

if [ "$(pwd)" != "$HOME/cachy" ]; then
    echo "Error: You should be in the ~/cachy directory."
    exit 1
else
    echo "You are in the ~/cachy directory. Continuing script execution..."
fi

echo "Please ensure github's ssh key is setup before running this script"

echo "Attempting to sync remote changes"
git pull

# Arch Repository & AUR

echo "----- Sync package repositories"
paru -Syu

echo "----- Installing flatpak"
paru --noconfirm -S flatpak

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo "----- Installing Gnome Software"
paru --noconfirm -S gnome-software

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

echo "----- Installing Zed Preview (Code editor)"
paru --noconfirm -S zed-preview-bin

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

echo "----- Installing Google Chrome"
paru --noconfirm -S google-chrome

echo "----- Installing ProtonVPN"
paru --noconfirm -S proton-vpn-gtk-app

echo "----- Installing Postgresql"
paru --noconfirm -S postgresql
echo "Remember to initialize the postgres database from the postgres user account as the database does not exist by default and will refuse all non-socket connections"
echo "For more information, check the archlinux wiki"

echo "----- Installing Brave"
paru --noconfirm -S brave

echo "----- Installing Docker"
paru --noconfirm -S docker

# Flatpak

echo "----- Installing Parabolic (Online video downloader)"
flatpak install --noninteractive flathub org.nickvision.tubeconverter

echo "----- Installing Cartridges (Game launcher)"
flatpak install --noninteractive flathub page.kramo.Cartridges

echo "----- Installing Showtime (Video player)"
flatpak install --noninteractive flathub org.gnome.Showtime

echo "----- Installing Maps (Mapping and Navigation)"
flatpak install --noninteractive flathub org.gnome.Maps

echo "----- Installing Sober (Roblox on linux)"
flatpak install --noninteractive flathub org.vinegarhq.Sober

echo "----- Installing Minecraft Bedrock"
flatpak install --noninteractive flathub io.mrarm.mcpelauncher

echo "----- Installing Blockbench"
flatpak install --noninteractive flathub net.blockbench.Blockbench

echo "----- Installing Errands (TODO list)"
flatpak install --noninteractive flathub io.github.mrvladus.List

echo "----- Installing Podman (Docker container GUI management)"
flatpak install --noninteractive flathub io.podman_desktop.PodmanDesktop

# Bun Runtime

echo "----- Installing Bun"
curl -fsSL https://bun.sh/install | bash

# Rust

echo "----- Insatlling Rustup (Rust)"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Directory Creation

mkdir ~/Projects
mkdir ~/.themeRepos

# Install themes

echo "----- Installing gtk & libadwaita theme"
cd ~/.themeRepos || exit
git clone git@github.com:vinceliuice/MacTahoe-gtk-theme.git
git pull --force

cd ~/.themeRepos/MacTahoe-gtk-theme || exit

./install.sh -t pink -o solid
./install.sh -l -t pink -o solid

cd ~/cachy

echo "----- Installing icon theme"
cd ~/.themeRepos || exit
echo "----- Cloning MacTahoe icon theme from GitHub"
git clone git@github.com:vinceliuice/MacTahoe-icon-theme.git
echo "----- Syncing remote changes"
git pull --force

cd ~/.themeRepos/MacTahoe-icon-theme || exit

./install.sh -t pink -b

cd ~/cachy

echo "----- Installing cursor theme"
mkdir ~/.icons
echo "----- Ensuring cursor theme location is free"
rm ~/cachy/assets/MacOS-Tahoe-Cursor -rf
echo "----- Copying cursor theme assets"
cp ~/cachy/assets/MacOS-Tahoe-Cursor -r ~/.icons/

# Install Oh My Zsh

echo "----- Installing Oh My Zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "----- Installing NVM (Node version manager)"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

echo "----- Installing NVChad (Neovim configuration)"
git clone https://github.com/NvChad/starter ~/.config/nvim

echo "----- Installing Vencord (Discord modded client patches)"
sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"

echo "----- Installing Spicetify"
curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh | sh

source ~/.zshrc

sudo chown $USER /opt/spotify/ -R
spicetify backup apply
spicetify config sidebar_config 0
spicetify apply

echo "----- Configuring Git"
echo "----- Setting default git editor to Neovim"
git config --global core.editor "nvim"
echo "----- Setting default branch name to 'master' for git"
git config --global init.defaultBranch "master"

echo "----- Copying ZSH configuration files"
cp ./.zshrc ~/.zshrc
