#!/bin/bash
echo "It will take some mimutes, please wait util the install completed ^_^"

#back up
if [ -d vim ]; then
    mv -f ~/vim ~/vim_old
    echo "back up ~/vim"
fi
if [ -f .vimrc ]; then
    mv -f ~/.vimrc ~/.vimrc_old
    echo "back up ~/.vimrc"
fi
if [ -d .vim ]; then
    mv -f ~/.vim ~/.vim_old
    echo "back up ~/.vim"
fi

cp -f vimrc ~/.vimrc

#install vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
echo "installing bundle now......" > install_log
vim install_log -c "BundleInstall" -c "q" -c "q"

echo "All done"
