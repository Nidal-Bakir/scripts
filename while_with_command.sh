#!/bin/bash
array=(`ls -f`)

len=${#array[*]}

i=0
while [ $i -lt $len ]; do

  svgFile="${array[$i]}"
  inkscape -w 1024  $svgFile -o "pngs/${svgFile}.png"
  echo $svgFile

  let i++

done
