#!/bin/bash

if [ "$1" == "first_child" ]
then
  bspc config automatic_scheme first_child
  notify-send "Switched to first_child mode!"
  exit 0
elif [ "$1" == "longest_side" ]
then
  bspc config automatic_scheme longest_side
  notify-send "Switched to longest_side mode!"
  exit 0
elif [ "$1" == "spiral" ]
then
  bspc config automatic_scheme spiral
  notify-send "Switched to spiral mode!"
  exit 0
else
  notify-send "Invalid mode!"
  exit 1
fi
