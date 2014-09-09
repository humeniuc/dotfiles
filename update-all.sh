#!/bin/bash
git pull origin master
git submodule init
git submodule update
git submodule foreach git pull origin master

cd ./.vim/bundle/vimproc.vim/
make clean
make
