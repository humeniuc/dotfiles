#!/bin/bash
git pull origin master
git submodule init
git submodule update
git submodule foreach git pull --ff-only origin master

