#!/bin/bash
#############################################################
# Extract apks from Apps downloaded from Google Play Store
#
# Use: .\nipak.sh com.instagram.android
#############################################################
path=$(adb shell su -c pm path $1 | grep base.apk | cut -d ":" -f 2)
adb pull $path
mv base.apk $1.apk
