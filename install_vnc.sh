#!/bin/sh

# script to install VNC server on a rooted device over SSH
# inspired by
# - https://forum.xda-developers.com/showthread.php?t=2654150

####
# THIS WASN'T TESTED
####

port=2223
source=libreversevncserver.so
destination=/storage/emulated/0
ip=172.17.41.251
bin=/system/bin
# check if there's already /system/bin/libreversevncserver.so installed
# if not
echo ssh root@$ip -p $port ls ${bin} | grep ${source}
installed=`ssh root@$ip -p $port ls ${bin} | grep ${source}`
    if $installed; then
    # push libreversevncserver.so to storage emulated
    echo scp -P $port $source "root@${ip}:${destination}"
    # remount /system
    echo mount -o remount,rw /system
    # move libreversevncserver.so to /system/bin
    echo mv $destination/$source $bin
    echo cd $bin
    echo chmown root:root $source
    echo chmod +x $source
fi

# start VNC server
echo $bin/$source
# shutdown VNC server
echo killall $source
