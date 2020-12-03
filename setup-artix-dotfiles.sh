#!/bin/sh

# Constants
TRUNK=$HOME/¦
REPOSDIR=$TRUNK/repositories

# Create file structure
mkdir $TRUNK
mkdir $REPOSDIR
mkdir $REPOSDIR/mine
mkdir $REPOSDIR/others
mkdir $HOME/scripts
mkdir $HOME/temporary-files

# Install packages
sudo pacman -Syu
sudo pacman -S \
	git \
	neovim python-pynvim \
	zsh zsh-syntax-highlighting \
	sway \
	bemenu-wlroots \
	feh \
	mpv \
	zathura-pdf-mupdf \
	qutebrowser qt5-wayland \
	texlive-core \
	man-db \
	ttf-fantasque-sans-mono \
	openscad

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
sh -c 'curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
sudo cp $REPOSDIR/mine/artix-dotfiles/rsit /usr/share/X11/xkb/symbols/rsit

# Change the default shell
chsh $USER -s /bin/zsh
