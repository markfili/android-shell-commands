#!/bin/bash

WHAT='Run any shell command on all devices connected via ADB'
USAGE='Usage: source adb_all.sh ANDROID_SHELL_COMMAND'

if [ $# -eq 0 ]; then
    echo "${WHAT}"
    echo "${USAGE}"
else
    adb devices
    result=$(adb devices -l | grep "transport_id" | awk '{print $6}' | cut -d':' -f2)
    for transport_id in $result
    do
        echo "running on ${transport_id}"
      # echo "adb -t ${transport_id} shell ${@}"
      adb -t $transport_id shell $@
    done
fi
