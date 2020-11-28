#!/bin/bash

# Constants
TRUNK=~/¦
REPOSDIR=$TRUNK/repositories

# Create file structure
mkdir $TRUNK
mkdir $REPOSDIR
mkdir $REPOSDIR/mine
mkdir $REPOSDIR/others
mkdir ~/temporary-files
mkdir ~/scripts

# Install packages
sudo pacman -Syu
sudo pacman -S \
	git \
	neovim \
	zsh zsh-syntax-highlighting \
	sway \
	bemenu-wlroots \
	feh \
	mpv \
	zathura-pdf-mupdf \
	qutebrowser qt5-wayland

# Install AUR packages
git clone https://aur.archlinux.org/yay.git $REPOSDIR/others/yay
(cd $REPOSDIR/others/yay && makepkg -si)
yay -S \
	foot-git foot-terminfo-git \
	lf-git

# Get the dotfiles
git clone https://github.com/timeopochin/artix-dotfiles $REPOSDIR/mine/artix-dotfiles
$REPOSDIR/mine/artix-dotfiles/sync-artix-dotfiles.sh $REPOSDIR/mine/artix-dotfiles

# Change the default shell
chsh $USER -s /bin/zsh
