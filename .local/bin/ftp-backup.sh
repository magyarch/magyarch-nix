#!/usr/bin/env bash

FTP_USER="deakfefe77"
FTP_PASS="Arkzk.t77"
FTP_HOST="192.168.50.1"

# Forrás → cél párok
declare -A DIRS=(
  ["/home/xeoncpu/nixos-flake"]="/sdb1/nixos-flake"
#  ["/home/xeoncpu/Zenék"]="/sdb1/Zenék"
 # ["/home/xeoncpu/Videók"]="/sdb1/Videók"
)

lftp -u "$FTP_USER","$FTP_PASS" "ftp://$FTP_HOST" <<EOF
$(for SRC in "${!DIRS[@]}"; do
    DST="${DIRS[$SRC]}"
    echo "mirror -R --verbose --continue --parallel=2 \"$SRC\" \"$DST\""
done)
EOF

