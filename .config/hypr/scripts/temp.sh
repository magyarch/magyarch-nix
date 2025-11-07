#!/usr/bin/env bash
# egyszerre adja vissza a két hőfokot "tctl edge" formában
sensors | awk '
  /Tctl:/ {tctl=$2}
  /edge:/ {edge=$2}
  END     {print " 🔥 " tctl "  |  💸 " edge}
'


