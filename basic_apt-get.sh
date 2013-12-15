#!/bin/bash
# apt-get calls to install basic packages
# needs root access

# Install Git
sudo apt-get install -y git-core

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
sudo apt-add-repository -y ppa:cassou/emacs
sudo apt-get update
sudo apt-get install -y emacs24 emacs24-el emacs24-common-non-dfsg

# libreadline features
sudo apt-get install -y rlwrap

# some utilities
sudo apt-get install -y gnome-tweak-tool xclip python-gpgme
