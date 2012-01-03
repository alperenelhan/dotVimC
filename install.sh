#/usr/bin/bash

#########################################################
#    Simple script for installing DotVimC config files. #
#    01.03.2012                                         #
#    Written by Osman Alperen Elhan                     #
#    http://elhan.org                                   #
#########################################################

VIMDIR="$HOME/.vim"
VIMRC="$HOME/.vimrc"

echo "Enter Backup Directory for existing VIM config [~/.vim_backup] : "
read BACKUPDIR
if [ -z $BACKUPDIR ]; then
    BACKUPDIR="$HOME/.vim_backup"
fi

while [ -d $BACKUPDIR ]; do
    echo "This directory already exists. Please choose another directory [~/.vim_backup] : "
    read BACKUPDIR
    if [ -z $BACKUPDIR ]; then
        BACKUPDIR="$HOME/.vim_backup"
    fi
done

echo "Installing..."

mkdir -p $BACKUPDIR

if [ -d $VIMDIR ]; then
    mv $VIMDIR $BACKUPDIR/
fi

if [ -f $VIMRC ]; then
    mv $VIMRC $BACKUPDIR/
fi

cp -r "dotVimC" "$HOME/.vim"
cp -r "dotVimCrc" "$HOME/.vimrc"

echo "Installation Finished..."

