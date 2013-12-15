#!/bin/bash

SCRIPT=$(readlink -f $0)
SCRIPTPATH=$(dirname $SCRIPT)

cd $HOME

wget http://git.kernel.org/cgit/git/git.git/plain/contrib/completion/git-completion.bash?id=HEAD -O $SCRIPTPATH/dotfiles/.git-completion.bash

ln -sb $SCRIPTPATH/dotfiles/.git-completion.bash .
