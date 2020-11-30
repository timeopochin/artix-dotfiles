#!/bin/sh

if ping -c 1 artixlinux.org > /dev/null
then
	read -p 'Root partition: ' ROOT_PART
	read -p 'Boot partition: ' BOOT_PART

	sudo mkfs.ext4 $ROOT_PART
	sudo mkfs.vfat $BOOT_PART

	sudo mount $ROOT_PART /mnt
	sudo mkdir /mnt/boot
	sudo mount $BOOT_PART /mnt/boot

	sudo basestrap /mnt base base-devel runit elogind-runit
	sudo basestrap /mnt linux linux-firmware

	sudo fstabgen -U /mnt >> fstab
	sudo cp fstab /mnt/etc/fstab

	artools-chroot /mnt

	umount -R /mnt
	reboot
else
	echo 'Connect to the internet before installation'
fi
