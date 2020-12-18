#!/bin/sh

# Constants
TRUNK=$HOME/¦
REPOSDIR=$TRUNK/repositories

# Create file structure
[ ! -d $TRUNK ] && mkdir $TRUNK
[ ! -d $REPOSDIR ] && mkdir $REPOSDIR
[ ! -d $REPOSDIR/mine ] && mkdir $REPOSDIR/mine
[ ! -d $REPOSDIR/others ] && mkdir $REPOSDIR/others
[ ! -d $HOME/scripts ] && mkdir $HOME/scripts
[ ! -d $HOME/temporary-files ] && mkdir $HOME/temporary-files

# Install packages
sudo pacman -Syu
sudo pacman -S --needed \
	git \
	neovim \
	zsh zsh-syntax-highlighting \
	sway \
	bemenu-wlroots \
	imv \
	mpv \
	zathura-pdf-mupdf \
	qutebrowser qt5-wayland \
	man-db \
	ttf-fantasque-sans-mono \
	openscad
#python-pynvim \
#texlive-core \

# Install AUR packages
if ! command -v yay &> /dev/null
then
	git clone https://aur.archlinux.org/yay.git $REPOSDIR/others/yay
	(cd $REPOSDIR/others/yay && makepkg -si)
fi
yay -S --needed \
	foot foot-terminfo \
	lf \
	#squeekboard \
	typeracer

# Get the dotfiles
[ ! -d $REPOSDIR/mine/artix-dotfiles ] && git clone https://github.com/timeopochin/artix-dotfiles $REPOSDIR/mine/artix-dotfiles
$REPOSDIR/mine/artix-dotfiles/sync-artix-dotfiles.sh $REPOSDIR/mine/artix-dotfiles
sh -c 'curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
#sudo cp $REPOSDIR/mine/artix-dotfiles/rsit /usr/share/X11/xkb/symbols/rsit

#if [ ! -f /usr/share/dbus-1/services/sm.puri.OSK0.service ]
#then
	#echo '[D-BUS Service]' > $HOME/temporary-files/sm.puri.OSK0.service
	#echo 'Name=sm.puri.OSK0' >> $HOME/temporary-files/sm.puri.OSK0.service
	#echo 'Exec=/usr/bin/squeekboard' >> $HOME/temporary-files/sm.puri.OSK0.service
	#sudo cp $HOME/temporary-files/sm.puri.OSK0.service /usr/share/dbus-1/services/sm.puri.OSK0.service
#fi

# Change the default shell
[ $SHELL != /bin/zsh ] && chsh $USER -s /bin/zsh
