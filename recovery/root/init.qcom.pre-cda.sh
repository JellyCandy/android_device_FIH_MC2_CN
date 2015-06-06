#!/system/bin/sh

# °õ¦æinitCDA
#/system/bin/InitCDA -initMultiCDA
/system/bin/InitCDA -initOneImage
/system/bin/mount -o remount,rw /system
/system/bin/chmod 111 /system/CDA
/system/bin/InitCDA -rebuildBuildProp
/system/bin/mount -o remount,ro /system

