#!/bin/sh

currentWindId=$(xdotool getwindowfocus)

braveWinId=$(xdotool search --class brave | awk 'END{print}')

key=$1

case $key in
'pp')
   xdotool windowactivate --sync $braveWinId key XF86AudioPlay && sleep 0.1 &&
      xdotool windowactivate $currentWindId
   ;;
'p')
   xdotool windowactivate --sync $braveWinId key XF86AudioPrev && sleep 0.1 &&
      xdotool windowactivate $currentWindId
   ;;
'n')
   xdotool windowactivate --sync $braveWinId key XF86AudioNext && sleep 0.1 &&
      xdotool windowactivate $currentWindId
   ;;
*)
   echo "pp for XF86AudioPlay"
   echo "p for XF86AudioPrev"
   echo "n for XF86AudioNext"
   exit 1
   ;;
esac
