#!/bin/bash
echo "It will take some mimutes, please wait util the install completed ^_^"

#back up
mv -f ~/vim ~/vim_old
mv -f ~/.vim ~/.vim_old
mv -f ~/.vimrc ~/.vimrc_old

cp -f vimrc ~/.vimrc

#install vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
echo "installing bundle now......" > install_log
vim install_log -c "BundleInstall" -c "q" -c "q"

echo "All done"
