#!/bin/bash

####################################################################
#
# Decompile all *.apk files from the run folder with apktool.
# 04/09/2021 - Nipe
####################################################################

PURPLE="\033[01;35m"
GRAY="\033[1;37m"
NC="\033[0m"


apks=$(find . -type f -name \*.apk)

echo "$apks" | while read line;do
	echo -e "${PURPLE}[$(date '+%R')] - Decompiling${GRAY} $line ${NC}"
	apktool d "$line"
done
