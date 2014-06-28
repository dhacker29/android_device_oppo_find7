# Copyright (C) 2012 The Android Open Source Project
# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""Custom OTA commands for find7 devices"""

def FullOTA_InstallEnd(info):
    info.script.AppendExtra('ifelse(is_substring("find7a", getprop("ro.oppo.device")), ui_print("{x}...Flashing Gummy Logo Image..."));')
    info.script.AppendExtra('ifelse(is_substring("find7a", getprop("ro.oppo.device")), package_extract_file("system/logo.bin", "/dev/block/platform/msm_sdcc.1/by-name/LOGO"));')
    info.script.AppendExtra('delete("/system/logo.bin");')
    info.script.AppendExtra('ifelse(is_substring("480", getprop("ro.sf.lcd_density")), run_program("/sbin/sh", "-c", "busybox mv /system/media/1080.zip /system/media/bootanimation.zip"));')
    info.script.AppendExtra('delete("/system/media/1080.zip");')
