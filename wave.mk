#
# Copyright (C) 2013 The CyanogenMod Project
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

# These are the hardware-specific configuration files
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Boot animation
TARGET_SCREEN_HEIGHT := 420
TARGET_SCREEN_WIDTH := 280

# Ramdisk
PRODUCT_COPY_FILES += \
	device/samsung/wave/init.wave.rc:root/init.wave.rc \
	device/samsung/wave/init.wave2.rc:root/init.wave2.rc \
	device/samsung/wave/init.wave.usb.rc:root/init.wave.usb.rc \
	device/samsung/wave/init.recovery.wave.rc:root/init.recovery.wave.rc \
	device/samsung/wave/init.recovery.wave2.rc:root/init.recovery.wave2.rc \
	device/samsung/wave/init.wave.usb.rc:recovery/root/usb.rc \
	device/samsung/wave/fstab.wave:root/fstab.wave \
	device/samsung/wave/fstab.wave:root/fstab.wave2 \
	device/samsung/wave/ueventd.wave.rc:root/ueventd.wave.rc \
	device/samsung/wave/ueventd.wave.rc:root/ueventd.wave2.rc \
	device/samsung/wave/twrp.fstab:recovery/root/etc/twrp.fstab \
	device/samsung/wave/partition.sh:recovery/root/partition.sh

# These are the hardware-specific configuration files
PRODUCT_COPY_FILES += \
	device/samsung/wave/prebuilt/asound.conf:system/etc/asound.conf \
	device/samsung/wave/libaudio/audio_policy.conf:system/etc/audio_policy.conf \
	device/samsung/wave/prebuilt/nvram_net_s8500.txt:system/vendor/firmware/nvram_net_s8500.txt \
	device/samsung/wave/prebuilt/nvram_net_s8530.txt:system/vendor/firmware/nvram_net_s8530.txt \
	device/samsung/wave/prebuilt/bcm4329_s8500.hcd:system/vendor/firmware/bcm4329_s8500.hcd \
	device/samsung/wave/prebuilt/bcm4329_s8530.hcd:system/vendor/firmware/bcm4329_s8530.hcd \
	device/samsung/wave/prebuilt/setmodel.sh:system/bin/setmodel.sh \

# Keylayout and Keychars
PRODUCT_COPY_FILES += \
	device/samsung/wave/prebuilt/usr/idc/mxt224_ts_input.idc:system/usr/idc/mxt224_ts_input.idc \
	device/samsung/wave/prebuilt/usr/keylayout/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
	device/samsung/wave/prebuilt/usr/keylayout/s5pv210-keypad.kl:system/usr/keylayout/s5pv210-keypad.kl \
	device/samsung/wave/prebuilt/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
	device/samsung/wave/prebuilt/usr/keychars/s5pv210-keypad.kcm:system/usr/keychars/s5pv210-keypad.kcm \
	device/samsung/wave/prebuilt/usr/keychars/sec_jack.kcm:system/usr/keychars/sec_jack.kcm \
	device/samsung/wave/prebuilt/usr/keychars/gpio-keys.kcm:system/usr/keychars/gpio-keys.kcm

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
	device/samsung/wave/prebuilt/media_profiles.xml:system/etc/media_profiles.xml \
	device/samsung/wave/prebuilt/media_codecs.xml:system/etc/media_codecs.xml

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
	audio.usb.default \
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
	DeviceSettings \
	Torch

# F2FS
PRODUCT_PACKAGES += \
	fsck.f2fs \
	mkfs.f2fs \
	fibmap.f2fs

# These are the hardware-specific settings that are stored in system properties.
# Note that the only such settings should be the ones that are too low-level to
# be reachable from resources or other mechanisms.
PRODUCT_PROPERTY_OVERRIDES += \
	wifi.interface=wlan0

# Override /proc/sys/vm/dirty_ratio on UMS
PRODUCT_PROPERTY_OVERRIDES += \
	ro.vold.umsdirtyratio=20

# Move Dalvik cache on /data partition
PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.dexopt-data-only=1

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Set default USB interface & ADB Mode
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp \
	persist.service.adb.enable=1

# The OpenGL ES API level that is natively supported by this device.
# This is a 16.16 fixed point number
PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version=131072

# Disable SELinux	
PRODUCT_PROPERTY_OVERRIDES += \
	ro.build.selinux=0

# Development & ADB authentication settings
ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.adb.secure=0 \
	ro.build.selinux=0 \
	ro.debuggable=1 \
	ro.secure=0

# Extended JNI checks
# The extended JNI checks will cause the system to run more slowly, but they can spot a variety of nasty bugs 
# before they have a chance to cause problems.
# Default=true for development builds, set by android buildsystem.
PRODUCT_PROPERTY_OVERRIDES += \
	ro.kernel.android.checkjni=0 \
	dalvik.vm.checkjni=false

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := mdpi

# call dalvik heap config
$(call inherit-product-if-exists, frameworks/native/build/phone-hdpi-dalvik-heap.mk)

# call the bcm firmware makefile
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4329/device-bcm.mk)

# call the proprietary setup
$(call inherit-product-if-exists, vendor/samsung/wave/wave-vendor.mk)
