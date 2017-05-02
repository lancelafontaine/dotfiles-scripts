#!/usr/bin/bash
DRIVE="/run/media/lancelafontaine/BACKUP";
DIRNAME="e560_$(date +%s)";
sudo mount -o remount,rw $DRIVE && 
sudo mkdir -p "$DRIVE/$DIRNAME" &&
pacman -Qqe > "$DRIVE/$DIRNAME/all_packages.txt" &&
echo "Writing /home and /etc to $DRIVE/$DIRNAME" &&
sudo rsync -aAX --info=progress2 /home/ "$DRIVE/$DIRNAME/home";
sudo rsync -aAX --info=progress2 /etc/ "$DRIVE/$DIRNAME/etc";

