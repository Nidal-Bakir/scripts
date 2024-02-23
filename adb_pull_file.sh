#!/bin/sh

[ -z "$1" ] && echo " Error file name empty." && exit 

adb -s 192.168.1.25:5555 pull /sdcard/Download/$1 /home/nidal/Downloads

