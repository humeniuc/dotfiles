#!/bin/bash
git pull origin master
git submodule foreach git pull origin master

cd ./.vim/bundle/vimproc.vim/
make clean
make
