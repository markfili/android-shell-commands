#!/bin/bash

# script to check what app is currently running in the foreground over SSH on multple devices.
# IP and port values are read from a file.
# File line format example:
# 192.168.1.12 -p 2223

while read line
do
    echo "$line"
    timeout 20 ssh -n -oStrictHostKeyChecking=no root@$line "dumpsys window windows | grep -E 'mCurrentFocus|mFocusedApp'"
    sleep 1
done < lots_of_ips.txt
