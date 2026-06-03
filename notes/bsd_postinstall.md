# Xorg-minimal
pkg add  x11/xorg-minimal

# Auto-egér bill felismerés
vim /etc/rc.conf

# ezt a 2 sort adjuk hozzá
hald_enable="YES"
dbus_enable="YES"

# xorg konfigolás
Xorg -configure
