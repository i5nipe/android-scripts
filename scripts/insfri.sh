#!/bin/bash

# Download and start frida server on the device connected via ADB

PURPLE="\033[01;35m"
GRAY="\033[1;37m"
NC="\033[0m"

# TODO: if frida is not installed?
versionFridaDesktop=`frida --version`


# Archs expected: arm, arm64, x86, x86_64
# TODO: if adb are not connected?
# TODO: if the return of getprop is different of the used on the frida repo?
archPro=`adb shell getprop ro.product.cpu.abi`

urlFridaServer=`echo https://github.com/frida/frida/releases/download/$versionFridaDesktop/frida-server-$versionFridaDesktop-android-$archPro.xz`

FridaServerFilename=`echo "frida-server-$versionFridaDesktop-android-$archPro.xz"`


echo -e "${PURPLE}[*]${GRAY} Downloading ${PURPLE}$FridaServerFilename${NC}\n"
curl -L "$urlFridaServer" -o "$FridaServerFilename"


unxz "$FridaServerFilename"
unxzFile=`echo ${FridaServerFilename::-3}`

adb push $unxzFile /data/local/tmp/frida-server
rm $unxzFile
adb shell chmod +x /data/local/tmp/frida-server

echo -e "${PURPLE}[*]${GRAY} Starting frida-server${NC}"
adb shell /data/local/tmp/frida-server &
