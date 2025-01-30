PURPLE="\033[01;35m"
GRAY="\033[1;37m"
NC="\033[0m"

# Read a list of package names and open the page of Play Store to download the App.
function nidoap() {
  list="$1"

  if [ "$#" -eq 0 ] || [ "$1" = "-h" ]; then

          echo -e "${PURPLE}Nidoap${NC} - Read a list of package names and open the page on Google ${GRAY}Play Store.${NC}"
          echo "Usage: nidoap [package | file with packages]"
          echo "Ex: nidoap com.instagram.android"
  else

    # Check if file exists
    if test -f "$1"; then

      while read line; do
        echo -e "${PURPLE}[*]${GRAY} Opening ${PURPLE}$line"
        DeepLink=$(adb </dev/null shell am start -a android.intent.action.VIEW -d https://play.google.com/store/apps/details\?id\=$line 2>/dev/null)

        echo -e "${PURPLE}[*] ${GRAY}Press Enter to continue"
        read nothing </dev/tty
      done < "$list"

    else 
            echo -e "${PURPLE}[*]${GRAY} Opening ${PURPLE}$1"
            DeepLink=$(adb </dev/null shell am start -a android.intent.action.VIEW -d https://play.google.com/store/apps/details\?id\=$1 2>/dev/null)
    fi
  fi
}

# Extract APK file from Apps installed in the device.
function nipak() {
  if [ "$#" -eq 0 ] || [ "$1" = "-h" ]; then

          echo -e "${PURPLE}Nipak${NC} -${GRAY}Extract APK${NC} from Apps installed in the device"
          echo "Usage: nipak [ package ]"
          echo "Ex: nipak com.instagram.android"
          exit
  else
    caminho=$(adb shell pm path $1 | grep base.apk | cut -d ":" -f 2)
    adb pull $caminho
    mv base.apk $1.apk
  fi
}

# Decompile all *.apk files from the current folder with apktool.
function nidecom() {
  apks=$(find . -type f -name \*.apk)

  echo "$apks" | while read line;do
    echo -e "${PURPLE}[$(date '+%R')] - Decompiling${GRAY} $line ${NC}"
    apktool d "$line"
done
}
