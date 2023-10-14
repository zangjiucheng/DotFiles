#!/bin/bash

# This script will clear all ZFS pools and volumes on the system.


zfs list -t snapshot -o name | grep rpool/var/spool@     | tac | tail -n +8 | xargs -n 1 zfs destroy -r
zfs list -t snapshot -o name | grep rpool/var/log@       | tac | tail -n +3 | xargs -n 1 zfs destroy -r
zfs list -t snapshot -o name | grep rpool/var/lib@       | tac | tail -n +3 | xargs -n 1 zfs destroy -r
zfs list -t snapshot -o name | grep rpool/var@           | tac | tail -n +3 | xargs -n 1 zfs destroy -r
zfs list -t snapshot -o name | grep rpool/home/root@     | tac | tail -n +10| xargs -n 1 zfs destroy -r
zfs list -t snapshot -o name | grep rpool/home/jiucheng@ | tac | tail -n +10| xargs -n 1 zfs destroy -r
zfs list -t snapshot -o name | grep rpool/home@          | tac | tail -n +3 | xargs -n 1 zfs destroy -r
zfs list -t snapshot -o name | grep rpool@       	 | tac | tail -n +3 | xargs -n 1 zfs destroy -r
zfs list -t snapshot -o name | grep rpool/ROOT@     	 | tac | tail -n +3 | xargs -n 1 zfs destroy -r
zfs list -t snapshot -o name | grep rpool/ROOT/debian@   | tac | tail -n +13| xargs -n 1 zfs destroy -r
zfs list -t snapshot -o name | grep bpool/BOOT/debian@   | tac | tail -n +8 | xargs -n 1 zfs destroy -r
zfs list -t snapshot -o name | grep bpool/BOOT@   	 | tac | tail -n +3 | xargs -n 1 zfs destroy -r
zfs list -t snapshot -o name | grep bpool@ 	   	 | tac | tail -n +3 | xargs -n 1 zfs destroy -r

