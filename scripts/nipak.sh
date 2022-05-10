#!/bin/bash
# Extract APK file from Apps installed in the device.       

if [ "$#" -eq 0 ] || [ "$1" = "-h" ]; then

        echo -e "${PURPLE}Nipak${NC} -${GRAY}Extract APK${NC} from Apps installed in the device"
        echo "Usage: nipak [ package ]"
        echo "Ex: nipak com.instagram.android"
        exit
fi

caminho=$(adb shell pm path $1 | grep base.apk | cut -d ":" -f 2)
adb pull $caminho
mv base.apk $1.apk
