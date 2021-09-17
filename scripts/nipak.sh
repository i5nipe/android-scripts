#!/bin/bash
#############################################################
# Extract APK file from Apps installed in the device.       
#
# Use: .\nipak.sh com.instagram.android
#############################################################

path=$(adb shell pm path $1 | grep base.apk | cut -d ":" -f 2)
adb pull $path
mv base.apk $1.apk
