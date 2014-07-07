# config.mk
#
# Product-specific compile-time definitions.
#

-include vendor/oppo/find7/BoardConfigVendor.mk

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Assert
TARGET_OTA_ASSERT_DEVICE := FIND7,find7,find7a,X9006,X9007,x9076

# Audio
BOARD_USES_ALSA_AUDIO := true
AUDIO_FEATURE_DISABLED_DS1_DOLBY_DDP := true
AUDIO_FEATURE_DISABLED_FM := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/oppo/find7/bluetooth

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS -DOPPO_CAMERA_HARDWARE

# Charger
BOARD_CHARGER_RES := device/oppo/find7/charger

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := default

# Graphics
USE_OPENGL_RENDERER := true
TARGET_USES_C2D_COMPOSITION := true
HAVE_ADRENO_SOURCE:= false

# Init
TARGET_INIT_VENDOR_LIB := libinit_find7

# Recovery
TARGET_RECOVERY_FSTAB := device/oppo/find7/rootdir/etc/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true

# Wifi
BOARD_HAS_QCOM_WLAN              := true
BOARD_HAS_QCOM_WLAN_SDK          := true
BOARD_WLAN_DEVICE                := qcwcn
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_qcwcn
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"
TARGET_USES_WCNSS_CTRL           := true
TARGET_USES_QCOM_WCNSS_QMI       := true
TARGET_USES_WCNSS_MAC_ADDR_REV   := true

# Enable CNE
#BOARD_USES_QCNE := true

# Enable CPU boosting events in the power HAL
TARGET_USES_CPU_BOOST_HINT := true

# Board specific SELinux policy variable definitions
BOARD_SEPOLICY_DIRS := \
   device/oppo/find7/sepolicy

# The list below is order dependent
BOARD_SEPOLICY_UNION += \
    file.te \
    device.te \
    app.te \
    cne.te \
    qmux.te \
    mpdecision.te \
    thermald.te \
    ueventd.te \
    vold.te \
    file_contexts \
    genfs_contexts \
    te_macros

PRODUCT_BOOT_JARS := $(subst $(space),:,$(PRODUCT_BOOT_JARS))

-include device/qcom/msm8974/BoardConfig.mk
