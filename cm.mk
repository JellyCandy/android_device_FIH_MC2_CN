## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := MC2_CN

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/FIH/MC2_CN/device_MC2_CN.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := MC2_CN
PRODUCT_NAME := cm_MC2_CN
PRODUCT_BRAND := InFocus
PRODUCT_MODEL := M512
PRODUCT_MANUFACTURER := FIH
