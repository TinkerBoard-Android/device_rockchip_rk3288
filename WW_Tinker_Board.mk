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
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
include device/rockchip/rk3288/BoardConfig.mk
$(call inherit-product, device/rockchip/rk3288/device.mk)
$(call inherit-product, device/rockchip/common/device.mk)

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_NAME := WW_Tinker_Board
PRODUCT_DEVICE := rk3288
PRODUCT_BRAND := asus
PRODUCT_MODEL := Tinker_Board
PRODUCT_MANUFACTURER := asus

TARGET_SKU := TW

# Get the long list of APNs
PRODUCT_COPY_FILES += vendor/rockchip/common/phone/etc/apns-full-conf.xml:system/etc/apns-conf.xml
PRODUCT_COPY_FILES += vendor/rockchip/common/phone/etc/spn-conf.xml:system/etc/spn-conf.xml
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.version = 1.0.0 \
    ro.product.ota.host = www.rockchip.com:2300

# audio jack auto switch function
PRODUCT_COPY_FILES += device/rockchip/rk3288/jack_auto_switch.sh:/system/bin/jack_auto_switch.sh
PRODUCT_COPY_FILES += device/rockchip/rk3288/audio.conf:/system/etc/audio.conf
