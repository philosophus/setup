#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 

SCRIPT=$(readlink -f $0)
SCRIPTPATH=$(dirname $SCRIPT)

$SCRIPTPATH/basic_apt-get.sh

# install dotfiles
cd $HOME
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi
ln -sb $SCRIPTPATH/dotfiles/.screenrc .
ln -sb $SCRIPTPATH/dotfiles/.bash_profile .
ln -sb $SCRIPTPATH/dotfiles/.bashrc .
ln -sb $SCRIPTPATH/dotfiles/.bashrc_custom .
ln -sf $SCRIPTPATH/dotfiles/.emacs.d .
ln -sf $SCRIPTPATH/dotfiles/.emacs
