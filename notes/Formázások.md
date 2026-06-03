# EXFAT
sudo mkfs.exfat -n "PENDRIVE" /dev/sdX 

# NTFS
sudo mkfs.ntfs -f -L "PENDRIVE" /dev/sdX

# FAT32
sudo mkfs.vfat -F 32 -n "PENDRIVE" /dev/sdX 

# EXT4
sudo mkfs.ext4 -L "LINUX_USB" /dev/sdX 
