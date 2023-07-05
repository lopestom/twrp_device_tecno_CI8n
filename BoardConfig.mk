#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 The TWRP Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Device path
DEVICE_PATH := device/tecno/CI8n

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a55

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a55

TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true
TARGET_SUPPORTS_64_BIT_APPS := true
TARGET_IS_64_BIT := true

# Enable CPUSets
ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := TECNO-CI8n
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true

# Platform
TARGET_BOARD_PLATFORM := mt6781
#BOARD_USES_MTK_HARDWARE := true

# Assert
TARGET_OTA_ASSERT_DEVICE := TECNO-CI8n

# Kernel
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2
BOARD_KERNEL_CMDLINE += androidboot.force_normal_boot=1
BOARD_KERNEL_IMAGE_NAME := Image.gz
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_KERNEL_TAGS_OFFSET := 0x0bc08000
BOARD_KERNEL_SECOND_OFFSET := 0xbff88000
BOARD_BOOT_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x07c08000
BOARD_DTB_OFFSET := 0x0bc08000

TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64

BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_MKBOOTIMG_ARGS += --base $(BOARD_KERNEL_BASE)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE) --board "CY-CI8N-H816"
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --second_offset $(BOARD_KERNEL_SECOND_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)

# File system type
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x2000000 # 33554432
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := erofs

# Partitions
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_USES_RECOVERY_AS_BOOT := true
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_NO_RECOVERY := true
TW_HAS_NO_RECOVERY_PARTITION := true

# Workaround for copying error vendor files to recovery ramdisk
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_SYSTEM_EXT = system_ext

# Dynamic Partitions
BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_SUPER_PARTITION_GROUPS := main
BOARD_MAIN_SIZE := 9122611200 # (BOARD_SUPER_PARTITION_SIZE - 4194304 - 4MB)
BOARD_MAIN_PARTITION_LIST := system vendor product system_ext odm

# System as root
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
BOARD_SUPPRESS_SECURE_ERASE := true

# Hack to get keymaster to recognize the key files & prevent anti rollback
PLATFORM_VERSION := 13
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)
PLATFORM_SECURITY_PATCH := 2099-12-31
BOOT_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

# Crypto
TW_INCLUDE_CRYPTO := false
#TW_INCLUDE_CRYPTO := true
#TW_INCLUDE_CRYPTO_FBE := true
#TW_INCLUDE_FBE_METADATA_DECRYPT := true
#TW_USE_FSCRYPT_POLICY := 2

# Metadata
BOARD_USES_METADATA_PARTITION := true
BOARD_ROOT_EXTRA_FOLDERS += metadata tranfs

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab
TARGET_RECOVERY_INITRC := $(DEVICE_PATH)/recovery/root/init.recovery.mt6781.rc

# AVB
BOARD_AVB_ENABLE := true
BOARD_AVB_VBMETA_SYSTEM := system product
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1
BOARD_AVB_VBMETA_VENDOR := vendor
BOARD_AVB_VBMETA_VENDOR_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_VENDOR_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX_LOCATION := 2

# AVB - Android Verified Boot / dm-verity
BOARD_AVB_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)

BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --set_hashtree_disabled_flag
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 2
BOARD_AVB_BOOT_KEY_PATH := $(DEVICE_PATH)/avb/oem_prvk.pem
BOARD_AVB_BOOT_ALGORITHM := SHA256_RSA2048
BOARD_AVB_BOOT_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_BOOT_ROLLBACK_INDEX_LOCATION := 3

#A11 DECRYPTION
BOARD_AVB_RECOVERY_ADD_HASH_FOOTER_ARGS += \
    --prop com.android.build.boot.os_version:$(PLATFORM_VERSION) \
    --prop com.android.build.boot.security_patch:$(PLATFORM_SECURITY_PATCH)

# TWRP specific build flags
RECOVERY_SDCARD_ON_DATA := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TARGET_USES_MKE2FS := true
TW_INCLUDE_NTFS_3G := true
TW_USE_TOOLBOX := true
TW_DEFAULT_LANGUAGE := ru
TW_EXTRA_LANGUAGES := false
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/config/usb_gadget/g1/functions/mass_storage.usb0/lun.%d/file"
TW_DEVICE_VERSION := TC 19 Pro_230606V290_V250_V433 by lopestom
TARGET_RECOVERY_LCD_BACKLIGHT_PATH := \"/sys/class/leds/lcd-backlight/brightness\"
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 130
TW_NO_SCREEN_BLANK := true
#TW_SKIP_COMPATIBILITY_CHECK := true
#TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
TW_INCLUDE_FASTBOOTD := true

TW_EXCLUDE_TWRPAPP := true
TW_EXCLUDE_APEX := true

BOARD_USE_FRAMEBUFFER_ALPHA_CHANNEL := true
TARGET_DISABLE_TRIPLE_BUFFERING := false

# Charger Mode
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_DISABLE_INIT_BLANK := true

# Storage
#TW_HAS_MTP := true
#TW_MTP_DEVICE := /dev/mtp_usb
#TW_INTERNAL_STORAGE_PATH := "/data/media/0"
#TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
#TW_EXTERNAL_STORAGE_PATH := "/external_sd"
#TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
#TW_DEFAULT_EXTERNAL_STORAGE := true

# resetprop and magiskboot
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_LIBRESETPROP := true

# Advanced: RAMDISK process - TWRP option
TW_INCLUDE_REPACKTOOLS := true

# Resolution
TW_THEME := portrait_hdpi
TARGET_SCREEN_WIDTH := 1080
TARGET_SCREEN_HEIGHT := 2460

# Statusbar icons flags 1080 x 2400
TW_STATUS_ICONS_ALIGN := center
#TW_CUSTOM_CPU_POS := 50
TW_CUSTOM_CLOCK_POS := 210
#TW_CUSTOM_BATTERY_POS := 800

# Debug
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true

