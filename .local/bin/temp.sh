#!/usr/bin/env bash
# egyszerre adja vissza a két hőfokot "tctl edge" formában
sensors | awk '
   /Core 0:/ {core=$3}
  /Tctl:/ {tctl=$2}
  /edge:/ {edge=$2}
  END     {print " 🔥 " core "  |  💸 " edge}
'


