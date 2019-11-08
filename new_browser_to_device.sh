#!/bin/bash

# a script to remove existing and install new android's webview browser to a rooted device
# download a prebuild webview for your device from google's repos

# while read IP
# do
    BROWSER_APK=/home/marko/Development/android/sources/chromium-webview/prebuilt/arm/webview.apk
    IP=172.17.31.126:5555
    echo $IP
    wait
    timeout 20 xterm -e "adb disconnect;"
    wait
    timeout 20 xterm -e "adb connect $IP;"
    wait
    timeout 20 xterm -e "adb shell 'dumpsys package com.android.webview' | grep versionName; sleep 10;"
    wait
    timeout 20 xterm -e "adb push browser_install.sh /data/local/tmp;"
    wait
    timeout 20 xterm -e "adb shell 'chmod 755 /data/local/tmp/browser_install.sh';"
    wait
    timeout 20 xterm -e "adb shell './data/local/tmp/browser_install.sh'"
    wait
    timeout 20 xterm -e "adb install ${BROWSER_APK}"
    wait
    timeout 20 xterm -e "adb shell 'dumpsys package com.android.webview' | grep versionName; sleep 10;"
    wait
    # timeout 20 xterm -e "adb reboot;"
    # wait
# done < betinvent_devices.txt
