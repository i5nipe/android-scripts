#!/bin/bash
#
# Automation for PASSIVE analysis of android communication.
# Need tcpdump binary in "/data/local/tmp/tcpdump".
#

PURPLE="\033[01;35m"
GRAY="\033[1;37m"
NC="\033[0m"

if test "$1" = "-h" ;then
	echo "Usage of niadump"
	echo -e "-h \t Show this help message."
	echo -e "-p \t Extract and delete /sdcard/out.pcap file from android."
	exit
fi
if test "$1" = "-p" ; then
	echo -e "${GRAY}[*]${PURPLE} Transferring${GRAY} /sdcard/out.pcap${NC}"
	adb pull /sdcard/out.pcap

	echo -e "${GRAY}[*]${PURPLE} Erasing${GRAY} /sdcard/out.pcap${NC}"
	adb shell su -c rm /sdcard/out.pcap

	echo -e "\n${GRAY}[*]${PURPLE} Opening WireShark${NC}"
	nohup wireshark -r out.pcap > /dev/null 2>&1&
	exit 1
fi

echo -e "${GRAY}[*]${PURPLE} Erasing${GRAY} /sdcard/out.pcap"
adb shell su -c rm /sdcard/out.pcap

echo -e "\n${GRAY}[*]${PURPLE} Starting tcpdump${NC}"
adb shell su -c /data/local/tmp/tcpdump -i any -p -v -s 0 -w /sdcard/out.pcap


