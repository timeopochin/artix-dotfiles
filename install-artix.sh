#!/bin/sh

if ping -q -c 1 -W 8.8.8.8 > /dev/null
then
	read -p 'Root partition: ' ROOT_PART
	read -p 'Boot partition: ' BOOT_PART
	read -p 'Username: ' USERNAME
	read -p 'Host name: ' HOST_NAME

	sudo mkfs.ext4 $ROOT_PART
	sudo mkfs.vfat $BOOT_PART

	sudo mount $ROOT_PART /mnt
	sudo mkdir /mnt/boot
	sudo mount $BOOT_PART /mnt/boot

	sudo basestrap /mnt base base-devel runit elogind-runit
	sudo basestrap /man linux linux-firmware

	sudo fstabgen -U /mnt >> fstab
	sudo cp fstab /mnt/etc/fstab

	artools-chroot /mnt

	ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
	hwclock --systohc

	echo 'LANG="fr_FR.UTF-8"' > /etc/locale.conf

	pacman -S grub efibootmgr
	grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub
	grub-mkconfig -o /boot/grub/grub.cfg

	echo 'root password'
	passwd

	useradd -m $USERNAME
	echo "$USERNAME password"
	passwd $USERNAME

	echo $HOST_NAME > /etc/hostname
	pacman -S dhcpcd wpa_supplicant
	echo '127.0.0.1		localhost' >> /etc/hosts
	echo '::1				localhost' >> /etc/hosts
	pacman -S connman-runit
	ln -s /etc/runit/sv/connmand /etc/runit/runsvdir/default

	exit
	umount -R /mnt
	reboot
else
	echo 'Connect to the internet before installation'
fi
