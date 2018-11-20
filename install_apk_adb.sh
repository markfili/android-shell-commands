#!/bin/bash

# install APK over ADB
# IP and port settings are read from a file
# file line format example:
# 192.168.1.12

ADB=/home/user/Android/Sdk/platform-tools/adb
APK_FOLDER=home/user/Development/android/projects/test/app/build/outputs/apk
APK_NAME="app-debug.apk"
APP_PACKAGE_NAME="com.betinvent.display"
APP_LAUNCHER_ACTIVITY="${APP_PACKAGE_NAME}.screens.SplashActivity"
NEW_APP_LOCATION="/storage/emulated/0"

while read line
do
    echo "$line";
    IP="$(echo $line | cut -d' ' -f1)"
    xterm -e "$ADB disconnect; sleep 2; $ADB connect $IP; sleep 2; $ADB push ${APK_FOLDER}/${APK_NAME} ${NEW_APP_LOCATION}/${APK_NAME}; sleep 2; $ADB shell 'am force-stop ${APP_PACKAGE_NAME}; pm install -r ${NEW_APP_LOCATION}/${APK_NAME}; am start -n${APP_PACKAGE_NAME}/${APP_LAUNCHER_ACTIVITY};'; sleep 1"
done < lots_of_ips.txt
