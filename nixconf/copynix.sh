#!/bin/sh

installed_dir=$(dirname $(readlink -f $(basename `pwd`)))

##################################################################################################################


echo
tput setaf 2
echo "################################################################"
echo "################### Copy over config and build"
echo "################################################################"
tput sgr0
echo

sudo cp -vf *.nix /etc/nixos/

sudo nixos-rebuild switch

sudo nix-collect-garbage

echo
echo
tput setaf 6
echo "################################################################"
echo "################### Done"
echo "################################################################"
tput sgr0
echo

