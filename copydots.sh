#!/usr/bin/env bash

installed_dir=$(dirname $(readlink -f $(basename `pwd`)))

##################################################################################################################


echo
tput setaf 2
echo "################################################################"
echo "################### Copy over config"
echo "################################################################"
tput sgr0
echo

cp -rf .config ~
cp -rf .local ~
cp -rf .themes ~
cp -rf .icons ~
cp -rf .fonts ~
#cp -rf .xmonad ~
cp .zshenv ~
cp .profile ~
cp .xprofile ~
cp .Xresources ~

echo
echo
tput setaf 6
echo "################################################################"
echo "################### Done"
echo "################################################################"
tput sgr0
echo

