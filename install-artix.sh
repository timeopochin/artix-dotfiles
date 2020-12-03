#!/bin/sh

curl -fsSL https://raw.github.com/timeopochin/artix-dotfiles/master/en-rsit.map > en-rsit.map
sudo loadkeys en-rsit.map

read -p 'Root partition: ' ROOT_PART
read -p 'Boot partition: ' BOOT_PART

sudo mkfs.ext4 $ROOT_PART
sudo mkfs.vfat $BOOT_PART

sudo mount $ROOT_PART /mnt
sudo mkdir /mnt/boot
sudo mount $BOOT_PART /mnt/boot

sudo basestrap /mnt \
	base \
	base-devel \
	runit \
	elogind-runit \
	linux \
	linux-firmware

fstabgen -U /mnt >> fstab
sudo cp fstab /mnt/etc/fstab

artools-chroot /mnt "sh -c $(curl -fsSL https://raw.github.com/timeopochin/artix-dotfiles/master/install-artix-post-chroot.sh)"

umount -R /mnt
reboot
