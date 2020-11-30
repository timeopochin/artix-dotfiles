#!/bin/sh

read -p 'Username: ' USERNAME
read -p 'Host name: ' HOST_NAME

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
echo '::1			localhost' >> /etc/hosts
pacman -S connman-runit
ln -s /etc/runit/sv/connmand /etc/runit/runsvdir/default

exit
