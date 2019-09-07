#!/usr/bin/env bash
# ====================================================
#   Copyright (C)2019 All rights reserved.
#
#   Author        : Xin-Xin MA
#   Email         : xxmawhu@163.com
#   File Name     : setup.sh
#   Created Time  : 2019-09-07 21:27
#   Last Modified : 2019-09-07 21:29
#   Describe      :
#
# ====================================================
echo "It will take some mimutes, please wait util the install completed ^_^"

#back up
if [ -d ~/vim ]; then
    mv -f ~/vim ~/vim_old
    echo "back up ~/vim"
fi
if [ -f ~/.vimrc ]; then
    mv -f ~/.vimrc ~/.vimrc_old
    echo "back up ~/.vimrc"
fi
if [ -d ~/.vim ]; then
    mv -f ~/.vim ~/.vim_old
    echo "back up ~/.vim"
fi

cp -f vimrc ~/.vimrc

#install vundle
echo "installing bundle now......"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "install bundle successful!"

vim +PluginInstall +qall
