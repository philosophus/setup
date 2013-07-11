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
BASEDIR=$(dirname $0)
cd $HOME
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi
ln -sb $BASEDIR/dotfiles/.screenrc .
ln -sb $BASEDIR/dotfiles/.bash_profile .
ln -sb $BASEDIR/dotfiles/.bashrc .
ln -sb $BASEDIR/dotfiles/.bashrc_custom .
ln -sf $BASEDIR/dotfiles/.emacs.d .
