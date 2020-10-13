#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
mv add-SOC_AUDIO-usb2-usb3-opi_zero_openwrt-master.patch openwrt/add-SOC_AUDIO-usb2-usb3-opi_zero_openwrt-master.patch
mv add-on_wifi-mac80211.patch openwrt/add-on_wifi-mac80211.patch
mv add-patch_dts_file-wifi-xradio.patch openwrt/add-patch_dts_file-wifi-xradio.patch
patch -p1 < add-SOC_AUDIO-usb2-usb3-opi_zero_openwrt-master.patch
patch -p1 < add-on_wifi-mac80211.patch
patch -p1 < add-patch_dts_file-wifi-xradio.patch
mv -f Makefile openwrt/package/kernel/xradio/Makefile
rm -rf openwrt/package/kernel/xradio/patches/052-add-wifi_xradio_xr819-driver.patch
mv -f xradio.patch openwrt/package/kernel/xradio/patches/xradio.patch
