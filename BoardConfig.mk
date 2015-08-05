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

BOARD_VENDOR := samsung

# Include path
TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

# Assert
#TARGET_OTA_ASSERT_DEVICE := 

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := wave
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := s5pc110

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_LOWMEM := true
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a8
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := false
TARGET_CPU_VARIANT := cortex-a8
MALLOC_IMPL := dlmalloc

# Ramdisk
TARGET_PROVIDES_INIT := true

# Release Tools
TARGET_RELEASETOOLS_EXTENSIONS := device/samsung/wave

# Kernel
BOARD_CUSTOM_BOOTIMG_MK := device/samsung/wave/shbootimg.mk
BOARD_USES_BML_OVER_MTD := true
BOARD_KERNEL_BASE := 0x32000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_CMDLINE := console=ttyFIQ0,115200 init=/init no_console_suspend
TARGET_KERNEL_CONFIG := GearKernel_wave_defconfig
TARGET_KERNEL_CUSTOM_TOOLCHAIN := arm-eabi-4.7
TARGET_KERNEL_SOURCE := kernel/samsung/aries

# Audio
BOARD_USES_GENERIC_AUDIO := false
AUDIO_FEATURE_ENABLED_INCALL_MUSIC := false
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := false

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/wave/bluetooth 
BOARD_BLUEDROID_VENDOR_CONF := device/samsung/wave/prebuilt/libbt_vndcfg.txt
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

# Boot Animation
TARGET_BOOTANIMATION_TEXTURE_CACHE := false
TARGET_BOOTANIMATION_USE_RGB565 := true

# Camera
BOARD_CAMERA_LIBRARIES := libcamera
BOARD_CAMERA_HAVE_ISO := true
BOARD_CAMERA_HAVE_FLASH := true
BOARD_V4L2_DEVICE := /dev/video1
BOARD_CAMERA_DEVICE := /dev/video0
BOARD_SECOND_CAMERA_DEVICE := /dev/video2

# CMHW
BOARD_HARDWARE_CLASS := device/samsung/wave/cmhw

# Filesystems
BOARD_NAND_PAGE_SIZE := 4096
BOARD_NAND_SPARE_SIZE := 128

BOARD_BOOTIMAGE_PARTITION_SIZE := 7864320
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 629145600
BOARD_USERDATAIMAGE_PARTITION_SIZE := 419430400
BOARD_FLASH_BLOCK_SIZE := 4096

# FM Radio
BOARD_FM_DEVICE := si4709
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO
BOARD_HAVE_FM_RADIO := true

# Graphics
BOARD_ALLOW_EGL_HIBERNATION := true
BOARD_CUSTOM_VSYNC_IOCTL := true
BOARD_EGL_CFG := $(LOCAL_PATH)/prebuilt/egl.cfg
BOARD_EGL_SYSTEMUI_PBSIZE_HACK := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true
BOARD_NO_PAGE_FLIPPING := false
BOARD_NO_32BPP := false
BOARD_SCREENRECORD_LANDSCAPE_ONLY := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_DISABLE_TRIPLE_BUFFERING := false
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
USE_OPENGL_RENDERER := true

# Radio
BOARD_MOBILEDATA_INTERFACE_NAME = "pdp0"
BOARD_USES_LIBSECRIL_STUB := true
TARGET_NO_RADIOIMAGE := true

# Recovery
BOARD_CUSTOM_GRAPHICS := ../../../device/samsung/aries-common/recovery/graphics.c
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/samsung/wave/recovery/recovery_keys.c
BOARD_HAS_NO_SELECT_BUTTON := true
RECOVERY_FSTAB_VERSION := 2
TARGET_NO_SEPARATE_RECOVERY := true
TARGET_RECOVERY_FSTAB := device/samsung/wave/fstab.wave
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/s3c-usbgadget/gadget/lun%d/file"

# Wi-Fi
BOARD_NO_WIFI_HAL           := true
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_WLAN_DEVICE_REV       := bcm4329
WIFI_DRIVER_MODULE_NAME     := "bcmdhd"
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP      := "/vendor/firmware/fw_bcmdhd_apsta.bin"

## TWRP ##
DEVICE_RESOLUTION := 480x800

TW_NO_BATT_PERCENT := true
TW_NO_CPU_TEMP := true

TW_NO_REBOOT_BOOTLOADER := true

BOARD_HAS_NO_REAL_SDCARD := true
RECOVERY_SDCARD_ON_DATA := true
TW_HAS_NO_RECOVERY_PARTITION := true
TW_DEFAULT_EXTERNAL_STORAGE := true

TW_EXCLUDE_ENCRYPTED_BACKUPS := true

TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"

TW_BRIGHTNESS_PATH := "/sys/class/backlight/s5p_bl/brightness"
TW_MAX_BRIGHTNESS := 255

# inherit from the proprietary version
#-include vendor/samsung/wave/BoardConfigVendor.mk
