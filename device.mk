#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

COMMON_PATH := device/xiaomi/sm8350-common

# Inherit from sm8350-common
$(call inherit-product, device/xiaomi/sm8350-common/common.mk)

# Camera
$(call inherit-product-if-exists, vendor/xiaomi/camera/miuicamera.mk)

PRODUCT_SYSTEM_PROPERTIES += \
    ro.miui.notch=1 \
    ro.product.mod_device=lisa_global

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

# Overlays-RRO
PRODUCT_PACKAGES += \
    lisaCNSettingsProviderOverlay \
    lisaCNWifiOverlay \
    lisaGLSettingsProviderOverlay \
    lisaGLWifiOverlay \
    lisaINSettingsProviderOverlay \
    lisaINWifiOverlay \
    libutils.vendor

# Matrixx
MATRIXX_CHIPSET := SM7325
MATRIXX_MAINTAINER := ComradeWave
MATRIXX_BATTERY := 4250mah
MATRIXX_DISPLAY := 1080x2400
BUILD_GOOGLE_CONTACTS := true
BUILD_GOOGLE_DIALER := true
BUILD_GOOGLE_MESSAGE := true
WITH_GMS := true

# Power
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/powerhint_yupik.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json


# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_platform_info_yupikqrd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_yupik/audio_platform_info_yupikqrd.xml \
    $(LOCAL_PATH)/audio/mixer_paths_yupikqrd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_yupik/mixer_paths_yupikqrd.xml \
    $(LOCAL_PATH)/audio/mixer_paths_overlay_dynamic.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_yupik/mixer_paths_overlay_dynamic.xml \
    $(LOCAL_PATH)/audio/mixer_paths_overlay_static.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_yupik/mixer_paths_overlay_static.xml \
    $(LOCAL_PATH)/audio/sound_trigger_mixer_paths_yupikqrd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_yupik/sound_trigger_mixer_paths_yupikqrd.xml \
    $(LOCAL_PATH)/audio/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_yupik/sound_trigger_platform_info.xml

# Sku properties
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/sku/,$(TARGET_COPY_OUT_ODM)/etc)

# WiFi Display
PRODUCT_SYSTEM_PROPERTIES += \
    vendor.sys.video.disable.ubwc=1

# MIUI Camera
$(call inherit-product-if-exists, vendor/xiaomi/camera/miuicamera.mk)

# Call the proprietary setup
$(call inherit-product, vendor/xiaomi/lisa/lisa-vendor.mk)
