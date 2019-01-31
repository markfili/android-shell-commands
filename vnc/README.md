I do not own the libreversevncserver.so files, they are uploaded here so they could be found more easily.

This is the original post on XDA forum from which most of the information and files come from: https://forum.xda-developers.com/showthread.php?t=2654150

The difference between the install process found in `install_vnc.sh` and the post above is that this repository doesn't use an APK but runs the .so file in the bash shell of a rooted Android system.

Here are some options when running from shell:
```
Starting from command line:
root@p211:# /system/bin/libreversevncserver.so

Command line parameters (optional):
-c Reverse connection host and port
-t tries : Number of tries for reverse connection 
-r : reconnect on reverse connections lost
-p localport : Local port for incoming connections. Default if 5901
-h : print this help
-v : view only
-s scale : scale percent (default is 100)
-d framebuffer device (default is /dev/graphics/fb0)
-z zoom : specify zoom of cursor coordinates in precents

E.g. (if permissions are right to run it non-sudo)
adb shell /path/to/libreversevncserver.so -c 192.168.1.34:5500 -r -p 5901
```
