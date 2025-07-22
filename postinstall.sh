#!/bin/bash

# Copyright (C) 2025 Ewsgit<ewsgit@ewsgit.uk>

echo "Performing post-installation steps for Ewsgit's CachyOS configuration."

echo "Please ensure github's ssh key is setup before running this script"

echo "Sync package repositories"
paru -Syu

paru --noconfirm -S ghostty ocs-url steam lutris discord vesktop visual-studio-code-bin figma-linux protonplus

cd ~ || exit

mkdir Projects
mkdir .themeRepos

cd ~/.themeRepos || exit

echo "Installing gtk & libadwaita theme"
git clone git@github.com:vinceliuice/MacTahoe-gtk-theme.git

cd MacTahoe-git-theme || exit

./install.sh -t pink -o solid
./install.sh -l -t pink -o solid

echo "Installing icon theme"
git clone git@github.com:vinceliuice/MacTahoe-icon-theme.git

cd MacTahoe-icon-theme || exit

./install.sh -t pink -b

echo "Installing cursor theme"
xdg-open