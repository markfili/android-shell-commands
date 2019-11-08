#!/bin/bash

# a script to install APK on multiple devices over SSH
# IP and port settings are read from a file
# file line format example:
# 192.168.1.12:2223

APK_FOLDER=home/user/Development/android/projects/test/app/build/outputs/apk
APK_FLAVOR=free
APK_BUILD_TYPE=debug
APK_FILE=app_debug.apk
APP_PACKAGE_NAME=com.test.app
APP_LAUNCHER_ACTIVITY="${APP_PACKAGE_NAME}.screens.SplashActivity"
DEVICES_IP_FILE=lots_of_ips.txt

SOURCE="/${APK_FOLDER}/${APK_FLAVOR}/${APK_BUILD_TYPE}/${APK_FILE}"

DEST=/storage/emulated/0/${APK_FILE}

while read line
do
    echo "$line";
    IP="$(echo $line | cut -d':' -f1)"
    PORT="$(echo $line | cut -d':' -f2)"
    timeout 20 scp -P $PORT $SOURCE root@$IP:$DEST;
    ssh -n -oStrictHostKeyChecking=no "root@${IP}" -p $PORT "am force-stop ${APP_PACKAGE_NAME}; mv ${DEST} /data/local/tmp/; pm install -r -t -d /data/local/tmp/${APK_FILE}; am start -n${APP_PACKAGE_NAME}/${APP_LAUNCHER_ACTIVITY};";
    sleep 1;
done < $DEVICES_IP_FILE
