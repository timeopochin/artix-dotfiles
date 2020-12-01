#!/bin/bash

# Constants
TRUNK=~/¦
REPOSDIR=$TRUNK/repositories

# Create file structure
mkdir $TRUNK
mkdir $REPOSDIR
mkdir $REPOSDIR/mine
mkdir $REPOSDIR/others
mkdir ~/scripts
mkdir ~/temporary-files

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
	qutebrowser qt5-wayland \
	texlive-core \
	python3 python-pip \
	man-db \
	ttf-fantasque-sans-mono

# Install AUR packages
git clone https://aur.archlinux.org/yay.git $REPOSDIR/others/yay
(cd $REPOSDIR/others/yay && makepkg -si)
yay -S \
	foot foot-terminfo \
	lf \
	squeekboard

# Get the dotfiles
git clone https://github.com/timeopochin/artix-dotfiles $REPOSDIR/mine/artix-dotfiles
$REPOSDIR/mine/artix-dotfiles/sync-artix-dotfiles.sh $REPOSDIR/mine/artix-dotfiles
sh -c 'curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
python3 -m pip install --user --upgrade pynvim

# Change the default shell
chsh $USER -s /bin/zsh
