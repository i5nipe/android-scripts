#!/bin/bash
############################################################################
# Read a list of package names and open the Play Store to download the app.
#
# 09/07/2021 - Nipe
############################################################################

PURPLE="\033[01;35m"
GRAY="\033[1;37m"
NC="\033[0m"

list=$1

while read line; do
	echo -e "${PURPLE}[*]${GRAY} Opening ${PURPLE}$line"
	DeepLink=$(adb </dev/null shell am start -a android.intent.action.VIEW -d https://play.google.com/store/apps/details\?id\=$line 2>/dev/null)

	echo -e "${PURPLE}[*] ${GRAY}Press Enter to continue"
	read nothing </dev/tty
done < "$list"
