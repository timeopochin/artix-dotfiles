#!/bin/sh

[ $1 ] && ARTIX_DOTFILES_DIR=$1
[ ! $ARTIX_DOTFILES_DIR ] && ARTIX_DOTFILES_DIR=$HOME/¦/repositories/mine/artix-dotfiles

if [ -d $ARTIX_DOTFILES_DIR ]
then
	cp -r $ARTIX_DOTFILES_DIR/home/.config $HOME
	cp $ARTIX_DOTFILES_DIR/home/.zshrc $HOME
	cp -r $ARTIX_DOTFILES_DIR/home/scripts $HOME
	chmod +x $HOME/scripts/*
	echo 'Done copying config files'
elif [ $ARTIX_DOTFILES_DIR ]
then
	echo "$ARTIX_DOTFILES_DIR is not a directory"
else
	echo 'Please provide the artix-dotfiles directory or set the value of $ARTIX_DOTFILES_DIR'
fi
