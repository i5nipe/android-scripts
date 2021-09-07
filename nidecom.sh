#!/bin/bash

####################################################################

# Decompila todos arquivos *.apk da pasta de execução com o apktool.
# 04/09/2021 - Nipe
####################################################################

PURPLE="\033[01;35m"
GRAY="\033[1;37m"
NC="\033[0m"


apks=$(find . -type f -name \*.apk)

echo "$apks" | while read line;do
	echo -e "${PURPLE}[$(date '+%R')] - Decompilando${GRAY} $line ${NC}"
	apktool d "$line"
done
