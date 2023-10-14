#!/bin/sh
# Author: Jiucheng Zang
# Date: 2023-08-17
# Version: v0.1
# This script is used to switch the ufw rule port for 445/tcp

# Check if the user is root 
if [ "$(id -u)" -ne 0 ];
then echo "Please run as root"
    exit
fi

if ! [ -x "$(command -v ufw)" ]; then
    echo 'Error: ufw is not installed.' >&2
    apt-get install ufw
    exit    
fi

if ufw status | grep "445" | grep -q "ALLOW"; then
    ufw deny 445
    echo "Port 445/tcp is now denied"
else
    ufw allow 445
    echo "Port 445/tcp is now allowed"
fi
