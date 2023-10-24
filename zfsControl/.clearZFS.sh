#!/bin/bash

# This script will clear all ZFS pools and volumes on the system.


zfs list -t snapshot -o name | grep rpool/var/spool@zfs-auto     | tac | tail -n +8 | xargs -n 1 zfs destroy -r
zfs list -t snapshot -o name | grep rpool/var/log@zfs-auto       | tac | tail -n +3 | xargs -n 1 zfs destroy -r
zfs list -t snapshot -o name | grep rpool/var/lib@zfs-auto       | tac | tail -n +3 | xargs -n 1 zfs destroy -r
zfs list -t snapshot -o name | grep rpool/var@zfs-auto           | tac | tail -n +3 | xargs -n 1 zfs destroy -r
zfs list -t snapshot -o name | grep rpool/home/root@zfs-auto     | tac | tail -n +10| xargs -n 1 zfs destroy -r
zfs list -t snapshot -o name | grep rpool/home/jiucheng@zfs-auto | tac | tail -n +10| xargs -n 1 zfs destroy -r
zfs list -t snapshot -o name | grep rpool/home@zfs-auto          | tac | tail -n +3 | xargs -n 1 zfs destroy -r
zfs list -t snapshot -o name | grep rpool@zfs-auto       	 | tac | tail -n +3 | xargs -n 1 zfs destroy -r
zfs list -t snapshot -o name | grep rpool/ROOT@zfs-auto     	 | tac | tail -n +3 | xargs -n 1 zfs destroy -r
zfs list -t snapshot -o name | grep rpool/ROOT/debian@zfs-auto   | tac | tail -n +13| xargs -n 1 zfs destroy -r
zfs list -t snapshot -o name | grep bpool/BOOT/debian@zfs-auto   | tac | tail -n +8 | xargs -n 1 zfs destroy -r
zfs list -t snapshot -o name | grep bpool/BOOT@zfs-auto   	 | tac | tail -n +3 | xargs -n 1 zfs destroy -r
zfs list -t snapshot -o name | grep bpool@zfs-auto 	   	 | tac | tail -n +3 | xargs -n 1 zfs destroy -r

