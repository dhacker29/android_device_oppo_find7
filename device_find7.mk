#
# Copyright (C) 2014 dhacker29
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
LOCAL_PATH := device/oppo/find7

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

PRODUCT_BOOT_JARS += qcmediaplayer

# Feature definition files for 8974
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml

# Audio configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/audio/mixer_paths.xml:system/etc/mixer_paths.xml \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:system/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/acdb/MTP_Bluetooth_cal.acdb:system/etc/acdbdata/MTP/MTP_Bluetooth_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP_General_cal.acdb:system/etc/acdbdata/MTP/MTP_General_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP_Global_cal.acdb:system/etc/acdbdata/MTP/MTP_Global_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP_Handset_cal.acdb:system/etc/acdbdata/MTP/MTP_Handset_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP_Hdmi_cal.acdb:system/etc/acdbdata/MTP/MTP_Hdmi_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP_Headset_cal.acdb:system/etc/acdbdata/MTP/MTP_Headset_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP_Speaker_cal.acdb:system/etc/acdbdata/MTP/MTP_Speaker_cal.acdb

PRODUCT_PACKAGES += \
    audiod

PRODUCT_PROPERTY_OVERRIDES += \
    ro.qc.sdk.audio.fluencetype=fluence \
    av.offload.enable=true \
    av.streaming.offload.enable=true \
    audio.offload.gapless.enabled=false \
    audio.offload.pcm.enable=true \
    qemu.hw.mainkeys=1\
    view.scroll_friction=1\
    ro.min_pointer_dur=8\
    ro.min_fling_velocity=8000\
    ro.max_fling_velocity=16000

# Camera
PRODUCT_PACKAGES += \
    camera.MSM8974

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# Connectivity Engine support
ifeq ($(BOARD_USES_QCNE),true)
PRODUCT_PACKAGES += \
    init.cne.rc \
    libcnefeatureconfig \
    services-ext

PRODUCT_PROPERTY_OVERRIDES += persist.cne.feature=1
endif

# GPS
PRODUCT_PACKAGES += \
    gps.msm8974

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/gps/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/gps/flp.conf:system/etc/flp.conf \
    $(LOCAL_PATH)/gps/izat.conf:system/etc/izat.conf \
    $(LOCAL_PATH)/gps/quipc.conf:system/etc/quipc.conf \
    $(LOCAL_PATH)/gps/sap.conf:system/etc/sap.conf

PRODUCT_PROPERTY_OVERRIDES += \
    ro.qc.sdk.izat.premium_enabled=1 \
    ro.qc.sdk.izat.service_mask=0x5 \
    persist.gps.qc_nlp_in_use=0 \
    ro.gps.agps_provider=1

# Keystore
PRODUCT_PACKAGES += \
    keystore.msm8974

# Lights
PRODUCT_PACKAGES += \
    lights.MSM8974

# NFC packages
ifeq ($(TARGET_BUILD_VARIANT),user)
    NFCEE_ACCESS_PATH := $(LOCAL_PATH)/configs/nfcee_access.xml
else
    NFCEE_ACCESS_PATH := $(LOCAL_PATH)/configs/nfcee_access_debug.xml
endif
PRODUCT_COPY_FILES += \
    $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml

PRODUCT_PACKAGES += \
    nfc.msm8974 \

# Sensors
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensor_def_qcomdev.conf:system/etc/sensor_def_qcomdev.conf

# Root overrides
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:root/fstab.qcom \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.rc:root/init.qcom.rc \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.sh:root/init.qcom.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.usb.rc:root/init.qcom.usb.rc \
    $(LOCAL_PATH)/rootdir/etc/init.target.rc:root/init.target.rc \
    $(LOCAL_PATH)/rootdir/etc/ueventd.qcom.rc:root/ueventd.qcom.rc \

# Thermal config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal-engine-8974.conf:system/etc/thermal-engine-8974.conf

# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini

# System properties
PRODUCT_PROPERTY_OVERRIDES += \
    debug.composition.type=dyn \
    ro.qualcomm.bt.hci_transport=smd \
    ro.telephony.default_network=9 \
    persist.data.tcpackprio.enable=true \
    telephony.lteOnGsmDevice=1 \
    telephony.lteOnCdmaDevice=0 \
    persist.radio.add_power_save=1 \
    persist.sys.usb.config=mtp,adb \
    ro.qc.sdk.camera.facialproc=true \
    ro.qualcomm.cabl=0 \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15 \
    ro.qualcomm.perf.cores_online=2

# Misc
PRODUCT_PACKAGES += \
    Launcher3 \
    libemoji

# World APN list
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/apns-conf.xml:system/etc/apns-conf.xml

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# call dalvik heap config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)

# call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

# call the proprietary setup
$(call inherit-product-if-exists, vendor/oppo/find7/find7-vendor.mk)

# Inherit from msm8974
$(call inherit-product, device/qcom/msm8974/msm8974.mk)
