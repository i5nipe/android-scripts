# Android scripts
Some extremely simple scripts that I use during bug bounty hunting in Android Apps.
- Some of this scripts need an ADB connection to work properly.
- For now, you need to have *only one* connection on ADB.

---
>### ☕ [nipak.sh](https://github.com/i5nipe/android-scripts/blob/master/scripts/nipak.sh)
Extract APK file from Apps installed in the device.
- Example of use: `./nipak.sh com.instagram.android`

---
>### ☕ [nisig.sh](https://github.com/i5nipe/android-scripts/blob/master/scripts/nisig.sh)
Sign APK files.
- Example of use: `./nisig.sh modApp.apk`
- Dependencies: `jarsigner`, `keytool`

---
>### ☕ [nidoap.sh](https://github.com/i5nipe/android-scripts/blob/master/scripts/nidoap.sh)
Read a list of package names and open the page of Play Store to download the App.
- Example of use: `./nidoap.sh packages.txt` or `./nidoap.sh com.instagram.android`

---
>### ☕ [nidecom.sh](https://github.com/i5nipe/android-scripts/blob/master/scripts/nidecom.sh)
Decompile all *.apk files from the current folder with apktool.

---
>### ☕ [niadump.sh](https://github.com/i5nipe/android-scripts/blob/master/scripts/niadump.sh)
Automation for *PASSIVE* analysis of Android communication.
- Need tcpdump binary in "/data/local/tmp/tcpdump"
