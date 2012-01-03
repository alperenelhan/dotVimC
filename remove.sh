#/usr/bin/bash

#########################################################
#    Simple script for removing DotVimC config files.   #
#    01.03.2012                                         #
#    Written by Osman Alperen Elhan                     #
#    http://elhan.org                                   #
#########################################################

VIMDIR="$HOME/.vim"
VIMRC="$HOME/.vimrc"

echo "Do you want to restore old vim config ([Yes]/No) : "

while [ true ]; do
    read choice
    case $choice in
        y|Y|YES|yes|Yes) break ;;
        n|N|no|NO|No)
            echo "Removing..."
            if [ -d $VIMDIR ]; then
                rm -rf $VIMDIR
            fi

            if [ -f $VIMRC ]; then
                rm -f $VIMRC
            fi
            echo "Removed..."
            exit
        ;;
        *) echo "Please enter only y or n"
    esac
done
echo "Enter Directory of backuped VIM config [~/.vim_backup] : "
read RESTOREDIR
if [ -z $RESTOREDIR ]; then
    RESTOREDIR="$HOME/.vim_backup"
fi

while [ ! -d $RESTOREDIR ]; do
    echo "This directory doesn't' exists. Please choose another directory [~/.vim_backup] : "
    read RESTOREDIR
    if [ -z $RESTOREDIR ]; then
        RESTOREDIR="$HOME/.vim_backup"
    fi
done

echo "Removing..."

if [ -d $VIMDIR ]; then
    rm -rf $VIMDIR
fi

if [ -f $VIMRC ]; then
    rm -f $VIMRC
fi

if [ -d "$RESTOREDIR/.vim" ]; then
    mv "$RESTOREDIR/.vim" $VIMDIR
fi

if [ -f "$RESTOREDIR/.vimrc" ]; then
    mv "$RESTOREDIR/.vimrc" $VIMRC
fi

if [ "$(ls -A $RESTOREDIR | wc -l)" == 0 ]; then
    rm -rf $RESTOREDIR
fi

echo "Removed..."
