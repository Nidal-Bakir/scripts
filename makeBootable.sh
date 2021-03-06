#!/bin/sh

iso_path=""
flash_mount_point="" # e.g: /dev/sdb1  use lsblk to know for sure!

Help() {    # Display Help
   echo "make bootable usb using dd command."
   echo "Please use this script with extra care, it may delete all your data or currupt your system."
   echo
   echo "Syntax: makeBootable <-f <path> -o <path> >|-h "
   echo "options:"
   echo "   -f     path to iso file."
   echo "   -o     path to usb mount point. hint: use lsblk to know the mounting point."
   echo "   -h     print this help message."
   echo
}

# Get the options
while getopts :f:o:h option; do
   case $option in
      f) # path to iso file 
        iso_path=$OPTARG
        ;;
      o) # flash mount point
         flash_mount_point=$OPTARG
         ;;
      h) # dispaly help message
         Help
         exit;;
      \?) # Invalid option
         echo "Error: Invalid option"
         exit;;
   esac
done
[ -z "$iso_path" ] && echo " error iso path empty." && exit 
[ -z "$flash_mount_point" ] && echo " error flash mount empty." && exit 


dd bs=4M if=$iso_path of=$flash_mount_point conv=fdatasync status=progress
