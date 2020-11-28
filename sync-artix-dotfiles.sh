#!/bin/bash

[[ $1 ]] && ARTIX_DOTFILES_DIR=$1
[[ ! $ARTIX_DOTFILES_DIR ]] && ARTIX_DOTFILES_DIR=~/¦/repositories/mine/artix-dotfiles

if [[ -d $ARTIX_DOTFILES_DIR ]]
then
	echo 'Copying files...'
	cp -r $ARTIX_DOTFILES_DIR/home/.config ~
	cp $ARTIX_DOTFILES_DIR/home/.zshrc ~
	cp -r $ARTIX_DOTFILES_DIR/home/scripts ~
	echo 'Done copying files'
elif [[ $ARTIX_DOTFILES_DIR ]]
then
	echo "$ARTIX_DOTFILES_DIR is not a directory"
else
	echo 'Please provide the artix-dotfiles directory or set the value of $ARTIX_DOTFILES_DIR'
fi
