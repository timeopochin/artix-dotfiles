#!/bin/sh

read -p 'Username: ' USERNAME
read -p 'Host name: ' HOST_NAME

ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
hwclock --systohc

echo 'fr_FR.UTF-8 UTF-8' >> /etc/locale.gen
locale-gen
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

KEYMAPDIR=/usr/share/kbd/keymaps/i386/rsit
mkdir $KEYMAPDIR
curl -fsSL https://raw.github.com/timeopochin/artix-dotfiles/master/en-rsit.map > $KEYMAPDIR/en-rsit.map
gzip $KEYMAPDIR
echo 'KEYMAP=en-rsit' > /etc/vconsole.conf

echo "$USERNAME ALL=(ALL) ALL" >> /etc/sudoers
