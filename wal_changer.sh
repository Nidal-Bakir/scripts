#!/bin/bash

DIR="/home/nidal/Pictures/Wallpapers/wal_changer_dir"
PIC=$(ls $DIR/* | shuf -n1)
gsettings set org.gnome.desktop.background picture-uri-dark "file://$PIC"
