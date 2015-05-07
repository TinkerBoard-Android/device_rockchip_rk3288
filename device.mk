#
# Copyright 2014 The Android Open-Source Project
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

PRODUCT_PACKAGES += \
    Launcher3

#$_rbox_$_modify_$_zhengyang: add displayd
PRODUCT_PACKAGES += \
    displayd

#enable this for support f2fs with data partion
#BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
# This ensures the needed build tools are available.
# TODO: make non-linux builds happy with external/f2fs-tool; system/extras/f2fs_utils
#ifeq ($(HOST_OS),linux)
#TARGET_USERIMAGES_USE_F2FS := true
#endif

#######for target product ########
ifeq ($(strip $(TARGET_BOARD_PLATFORM_PRODUCT)), box)

PRODUCT_PROPERTY_OVERRIDES += \
        ro.target.product=box
else
  PRODUCT_PROPERTY_OVERRIDES += \
        ro.target.product=tablet
endif

PRODUCT_COPY_FILES += \
    device/rockchip/rk3288/init.rc:root/init.rc

# setup dalvik vm configs.
$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)


$(call inherit-product-if-exists, vendor/rockchip/rk3288/device-vendor.mk)
