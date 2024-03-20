#!/bin/bash
git pull origin master
git submodule foreach git pull --ff-only origin HEAD
# git submodule update --init --recursive
