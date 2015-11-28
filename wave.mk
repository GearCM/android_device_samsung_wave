#
# Copyright (C) 2015 The CyanogenMod Project
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

LOCAL_PATH := device/samsung/wave

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Boot Animation
TARGET_SCREEN_HEIGHT := 320
TARGET_SCREEN_WIDTH := 240

# These are the hardware-specific configuration files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/asound.conf:system/etc/asound.conf \
    $(LOCAL_PATH)/configs/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/configs/wifi/nvram_net_s8500.txt:system/vendor/firmware/nvram_net_s8500.txt \
    $(LOCAL_PATH)/configs/wifi/nvram_net_s8530.txt:system/vendor/firmware/nvram_net_s8530.txt \
    $(LOCAL_PATH)/configs/wifi/bcm4329_s8500.hcd:system/vendor/firmware/bcm4329_s8500.hcd \
    $(LOCAL_PATH)/configs/wifi/bcm4329_s8530.hcd:system/vendor/firmware/bcm4329_s8530.hcd \
    $(LOCAL_PATH)/configs/platform/setmodel.sh:system/bin/setmodel.sh

# Init files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.wave.rc:root/init.wave.rc \
    $(LOCAL_PATH)/rootdir/etc/init.wave2.rc:root/init.wave2.rc \
    $(LOCAL_PATH)/rootdir/etc/init.wave.usb.rc:root/init.wave.usb.rc \
    $(LOCAL_PATH)/recovery/etc/init.recovery.wave.rc:root/init.recovery.wave.rc \
    $(LOCAL_PATH)/recovery/etc/init.recovery.wave2.rc:root/init.recovery.wave2.rc \
    $(LOCAL_PATH)/rootdir/etc/init.wave.usb.rc:recovery/root/usb.rc \
    $(LOCAL_PATH)/rootdir/etc/fstab.wave:root/fstab.wave \
    $(LOCAL_PATH)/rootdir/etc/fstab.wave:root/fstab.wave2 \
    $(LOCAL_PATH)/rootdir/etc/ueventd.wave.rc:root/ueventd.wave.rc \
    $(LOCAL_PATH)/rootdir/etc/ueventd.wave.rc:root/ueventd.wave2.rc \
    $(LOCAL_PATH)/recovery/etc/twrp.fstab:recovery/root/etc/twrp.fstab \
    $(LOCAL_PATH)/rootdir/etc/partition.sh:recovery/root/partition.sh

# Keylayout and Keychars
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/idc/mxt224_ts_input.idc:system/usr/idc/mxt224_ts_input.idc \
    $(LOCAL_PATH)/configs/keylayout/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
    $(LOCAL_PATH)/configs/keylayout/s5pv210-keypad.kl:system/usr/keylayout/s5pv210-keypad.kl \
    $(LOCAL_PATH)/configs/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/configs/keychars/s5pv210-keypad.kcm:system/usr/keychars/s5pv210-keypad.kcm \
    $(LOCAL_PATH)/configs/keychars/sec_jack.kcm:system/usr/keychars/sec_jack.kcm \
    $(LOCAL_PATH)/configs/keychars/gpio-keys.kcm:system/usr/keychars/gpio-keys.kcm

# SHP Modem interfaces
PRODUCT_PACKAGES += \
    libmocha-ril

# Filesystem management tools
PRODUCT_PACKAGES += \
    setup_fs \
    bml_over_mtd

# Usb accessory
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# These are the OpenMAX IL configuration files
PRODUCT_COPY_FILES += \
    hardware/samsung/exynos3/s5pc110/sec_mm/sec_omx/sec_omx_core/secomxregistry:system/etc/secomxregistry \
    $(LOCAL_PATH)/configs/media/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/media/media_codecs.xml:system/etc/media_codecs.xml

# These are the OpenMAX IL modules
PRODUCT_PACKAGES += \
    libSEC_OMX_Core \
    libOMX.SEC.AVC.Decoder \
    libOMX.SEC.M4V.Decoder \
    libOMX.SEC.M4V.Encoder \
    libOMX.SEC.AVC.Encoder

# Misc other modules
PRODUCT_PACKAGES += \
    lights.wave \
    sensors.wave \
    power.s5pc110 \
    hwcomposer.s5pc110 \
    camera.wave \
    gps.wave \
    audio.primary.wave \
    audio.a2dp.default \
    libril-client \
    libs3cjpeg

# Libs
PRODUCT_PACKAGES += \
    libstagefrighthw

# Bluetooth MAC Address
PRODUCT_PACKAGES += \
    bdaddr_read

# Device-specific packages
PRODUCT_PACKAGES += \
    GearCMParts \
    Torch

# Hardware Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# The OpenGL ES API level that is natively supported by this device.
# This is a 16.16 fixed point number
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072

# Disable CM Superuser
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.root_access=0

# Development & ADB authentication settings
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.adb.secure=0 \
    ro.build.selinux=0 \
    ro.debuggable=1 \
    ro.secure=0

# These are the hardware-specific settings that are stored in system properties.
# Note that the only such settings should be the ones that are too low-level to
# be reachable from resources or other mechanisms.
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0

# Dalvik VM Dexopt Flags
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dexopt-flags=m=y,u=y

# Extended JNI checks
# The extended JNI checks will cause the system to run more slowly, but they can spot a variety of nasty bugs 
# before they have a chance to cause problems.
# Default=true for development builds, set by android buildsystem.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    dalvik.vm.checkjni=false

# Override /proc/sys/vm/dirty_ratio on UMS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vold.umsdirtyratio=20

# Move Dalvik cache on /data partition
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dexopt-data-only=1

# Set default USB interface & ADB Mode
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp \
    persist.service.adb.enable=1

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# call dalvik heap config
$(call inherit-product-if-exists, frameworks/native/build/phone-hdpi-dalvik-heap.mk)

# call bcm4329 firmware config
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4329/device-bcm.mk)

# call the proprietary setup
$(call inherit-product-if-exists, vendor/samsung/wave/wave-vendor.mk)
