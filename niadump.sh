#!/bin/bash
#
# Automação para analise PASSIVA da comunicação android
#

PURPLE="\033[01;35m"
GRAY="\033[1;37m"
NC="\033[0m"

if test "$1" = "-h" ;then
	echo "Uso de niadump"
	echo -e "-h \t Mostra essa mensagem de ajuda."
	echo -e "-p \t Extrai e apaga arquivo /sdcard/out.pcap do android"
	exit
fi
if test "$1" = "-p" ; then
	echo -e "${GRAY}[*]${PURPLE} Transferindo${GRAY} /sdcard/out.pcap${NC}"
	adb pull /sdcard/out.pcap

	echo -e "${GRAY}[*]${PURPLE} Apagando${GRAY} /sdcard/out.pcap${NC}"
	adb shell su -c rm /sdcard/out.pcap

	echo -e "\n${GRAY}[*]${PURPLE} Abrindo wireshark${NC}"
	nohup wireshark -r out.pcap > /dev/null 2>&1&
	exit 1
fi

echo -e "${GRAY}[*]${PURPLE} Apagando${GRAY} /sdcard/out.pcap"
adb shell su -c rm /sdcard/out.pcap

echo -e "\n${GRAY}[*]${PURPLE} Iniciando tcpdump ${NC}"
adb shell su -c /data/local/tmp/tcpdump -i any -p -v -s 0 -w /sdcard/out.pcap


