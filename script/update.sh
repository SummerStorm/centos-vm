#!/bin/bash -eux
if [[ $UPDATE  =~ true || $UPDATE =~ 1 || $UPDATE =~ yes ]]; then
    echo "==> Remove useless packages"
    yum -y erase java libreoffice-* evolution pidgin ekiga gthumb cheese brasero totem gnote

    echo "==> Install new packages"
    yum -y install ksh lsb libXp alacarte

    echo "==> Applying updates"
    yum -y update

    # reboot
    echo "Rebooting the machine..."
    reboot
    sleep 60
fi
