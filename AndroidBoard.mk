LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

ALL_PREBUILT += $(INSTALLED_KERNEL_TARGET)
BOARD_VENDOR := FIH
# include the non-open-source counterpart to this file
-include vendor/FIH/MC2_CN/AndroidBoardVendor.mk
