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

# Boot Animation
TARGET_SCREEN_HEIGHT := 320
TARGET_SCREEN_WIDTH := 240

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/wave/wave.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/cm/config/common_mini_phone.mk)

# AAPT Config
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := mdpi

# Device identifier
PRODUCT_NAME := cm_wave
PRODUCT_DEVICE := wave
PRODUCT_MANUFACTURER := samsung
PRODUCT_MODEL := GT-S8500

PRODUCT_BRAND := samsung

TARGET_UNOFFICIAL_BUILD_ID := GearCM

PRODUCT_BOOTANIMATION := device/samsung/wave/prebuilts/bootanimation.zip
