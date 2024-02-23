#!/bin/sh

[ -z "$1" ] && echo " Error file path empty." && exit 

adb -s 192.168.1.25:5555 push $1 /sdcard/Download

