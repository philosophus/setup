#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 

# Install nvm: node-version manager
# https://github.com/creationix/nvm
sudo apt-get install -y git-core
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.12
nvm use v0.10.12

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
npm install -g jshint

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
sudo apt-add-repository -y ppa:cassou/emacs
sudo apt-get update
sudo apt-get install -y emacs24 emacs24-el emacs24-common-non-dfsg

# install dotfiles
SCRIPT=$(readlink -f $0)
SCRIPTPATH=$(dirname $SCRIPT)
cd $HOME
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi
ln -sb $SCRIPTPATH/dotfiles/.screenrc .
ln -sb $SCRIPTPATH/dotfiles/.bash_profile .
ln -sb $SCRIPTPATH/dotfiles/.bashrc .
ln -sb $SCRIPTPATH/dotfiles/.bashrc_custom .
ln -sf $SCRIPTPATH/dotfiles/.emacs.d .
