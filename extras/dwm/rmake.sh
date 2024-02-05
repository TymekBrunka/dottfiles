#!/usr/bin/bash

read -p "Commit message (blank for no commit): " msg
cp ./config.def.h ./config.h
sudo make clean install
if [[ -n $msg ]] ; then
    echo "jej"
    git add .
    git commit -m "$msg"
fi
