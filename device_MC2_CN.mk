$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/FIH/MC2_CN/MC2_CN-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/FIH/MC2_CN/overlay

LOCAL_PATH := device/FIH/MC2_CN

ifneq ($(OUT),)
ifeq ($(MK_KERNEL_OBJ),)
$(shell mkdir -p $(OUT)/obj/KERNEL_OBJ/usr/include 2>/dev/null)
MK_KERNEL_OBJ := true
endif
endif

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# fix rebooting into recovery
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/aboot:root/sbin/aboot \
    $(LOCAL_PATH)/recovery/aboot.sh:root/sbin/aboot.sh

$(call inherit-product, build/target/product/full.mk)

ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0 \
    ro.adb.secure=0 \
    persist.sys.usb.config=mtp,mass_storage

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_NAME := full_MC2_CN
PRODUCT_DEVICE := MC2_CN
