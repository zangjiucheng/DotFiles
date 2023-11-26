#!/bin/bash
# author:Jiucheng Zang
# Version 1.1
# Date: 2023-10-24

# Input two arguments, the first one is the snapshot name, the second one is the backup name.
# Used to backup the snapshot. (Will not be clear by clearZFS.sh)
#
zfs rename rpool/var/spool@zfs-auto-snap_$1 rpool/var/spool@BK_$2

zfs rename rpool/var/log@zfs-auto-snap_$1 rpool/var/log@BK_$2

zfs rename rpool/var/lib@zfs-auto-snap_$1 rpool/var/lib@BK_$2

zfs rename rpool/var@zfs-auto-snap_$1 rpool/var@BK_$2

zfs rename rpool/home/jiucheng@zfs-auto-snap_$1 rpool/home/jiucheng@BK_$2

zfs rename rpool/home/root@zfs-auto-snap_$1 rpool/home/root@BK_$2

zfs rename rpool/home@zfs-auto-snap_$1 rpool/home@BK_$2

zfs rename rpool@zfs-auto-snap_$1 rpool@BK_$2

zfs rename rpool/ROOT@zfs-auto-snap_$1 rpool/ROOT@BK_$2

zfs rename rpool/ROOT/debian@zfs-auto-snap_$1 rpool/ROOT/debian@BK_$2

zfs rename bpool/BOOT@zfs-auto-snap_$1 bpool/BOOT@BK_$2

zfs rename bpool/BOOT/debian@zfs-auto-snap_$1 bpool/BOOT/debian@BK_$2

zfs rename bpool@zfs-auto-snap_$1 bpool@BK_$2
