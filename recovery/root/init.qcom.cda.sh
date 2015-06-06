#!/system/bin/sh

## FihTdcCode@20140703 Edwin add for LSO-288: Use by-name partition path
/system/bin/UpdateCDA -r

#EricTseng@call CDA script@Begin
if cat "/hidden/data/CDA/CDAStatus"
then
    rm "/hidden/data/CDA/CDAStatus"
fi

# RFY-2206, Make sure that system partition can be accessed
mount -t ext4 -o remount,rw /dev/block/platform/msm_sdcc.1/by-name/system /system

chmod 100 /hidden/data/init.cust.sh
/hidden/data/init.cust.sh
#EricTseng@call CDA script@End

# RFY-2206, Remount system as read only
mount -t ext4 -o remount,ro /dev/block/platform/msm_sdcc.1/by-name/system /system

#Store master reset command for UpdateSKU
mkdir /data/recovery/
chown root.shell /data/recovery/
chmod 770 /data/recovery/

sleep 30
/system/bin/toolbox touch /storage/sdcard1
