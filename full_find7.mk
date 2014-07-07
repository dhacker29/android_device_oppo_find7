# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from find7 device
$(call inherit-product, device/oppo/find7/device_find7.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := full_find7
PRODUCT_DEVICE := find7
PRODUCT_BRAND := OPPO
PRODUCT_MANUFACTURER := OPPO
PRODUCT_MODEL := Find7
