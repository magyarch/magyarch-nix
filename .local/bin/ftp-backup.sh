#!/usr/bin/env bash

FTP_USER="deakfefe77"
FTP_PASS="Arkzk.t77"
FTP_HOST="192.168.50.1"

# ============================================================
# .config mappák kizárása — add hozzá amit NEM akarsz menteni
# ============================================================
EXCLUDE_DIRS=(
    "awesome"
    "discord"
    "heroic"
    "microsoft-edge"
    "BraveSoftware"
    "Thunar"
    "faugus-launcher"
    "geany"
    "goa"
    "steam"
    "ghb"
    "pulse"
    "dconf"
    "glib-2.0"
    "ibus"
    "btop"
    "bunkus.org"
    "autostart"
    "filezilla"
    "evolution"
    "fontconfig"
    "Electron"
    "Signal"
    "cosmic"
    "dgop"
    "cava"
    "clapper-0.0"
    "PasCube"
    "menus"
    "lact"
    "lftp"
    "lxqt"
    "fuzzel"
    "xmonad"
    "xfce4"
    "zsh"
)

# Forrás → cél párok
declare -A DIRS=(
  ["/home/xeoncpu/nixos-flake"]="/sdb1/nixos-flake"
  ["/home/xeoncpu/.config"]="/sdb1/.config"
# ["/home/xeoncpu/Videók"]="/sdb1/Videók"
)

# Kizárások összeállítása lftp mirror formátumra
build_excludes() {
    local args=""
    for dir in "${EXCLUDE_DIRS[@]}"; do
        args+=" --exclude-glob ${dir}/"
    done
    echo "$args"
}

EXCLUDES=$(build_excludes)

# lftp parancsok generálása
generate_commands() {
    for SRC in "${!DIRS[@]}"; do
        DST="${DIRS[$SRC]}"
        if [[ "$SRC" == *".config"* ]]; then
            # .config esetén kizárásokkal
            echo "mirror -R --verbose --continue --parallel=2 --no-symlinks --no-perms $EXCLUDES \"$SRC\" \"$DST\""
        else
            # Többi mappa kizárás nélkül
            echo "mirror -R --verbose --continue --parallel=2 --no-symlinks --no-perms \"$SRC\" \"$DST\""
        fi
    done
}

echo "========================================"
echo " FTP Backup indítása → $FTP_HOST"
echo "========================================"
echo " Kizárt .config mappák:"
for dir in "${EXCLUDE_DIRS[@]}"; do
    echo "   ✖ $dir"
done
echo "========================================"

lftp -u "$FTP_USER","$FTP_PASS" "ftp://$FTP_HOST" <<EOF
$(generate_commands)
EOF

echo "========================================"
echo " Backup kész!"
echo "========================================"
