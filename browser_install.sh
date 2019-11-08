#!/system/bin/sh

# this file is copied to a device and executed on it before a new browser is installed
# see new_browser_to_device.sh file

su -c "echo 'remount\n'; mount -o remount,rw /system; echo 'uninstall\n'; pm uninstall com.google.android.webview; pm uninstall com.android.webview; echo 'remove\n'; rm -rf /system/app/webview; rm -rf /data/user/0/com.android.webview"
