# wget http://mir.archlinux.fr/iso/2021.11.01/archlinux-bootstrap-2021.11.01-x86_64.tar.gz
FILE=$1
sudo tar xzf $FILE -C /tmp
cd /tmp/root.x86_64/
sudo cp /etc/resolv.conf etc
sudo mount --bind /tmp/root.x86_64 /tmp/root.x86_64
sudo mount -t proc /proc proc
sudo mount --make-rslave --rbind /sys sys
sudo mount --make-rslave --rbind /dev dev
echo "Server = http://mir.archlinux.fr/\$repo/os/\$arch" | sudo tee -a etc/pacman.d/mirrorlist
sudo chroot /tmp/root.x86_64 /bin/bash
