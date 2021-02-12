#!/bin/bash

help(){
    echo 'txt2ducky @Martinvlba (edit by Mirivan)'
    echo ''
    echo './txt2ducky.sh {input_file(.txt)} [output_file]'
    echo 'Adding STRING method for line and ENTER for executor'
    exit 1
}

NO_FORMAT="\033[0m"
F_BOLD="\033[1m"

[ -z $1 ] && help
while getopts ':hs:' opt; do
  case "$opt" in
   \?) help
       ;;
  esac
done

filein=$1
if [ ! -z $2 ]; then
    fileout=$2
else
    fileout=$1.rc
fi

[ ! -e $filein ] && echo File not found: $filein && exit 1
[ -e $fileout ] && rm $fileout

echo "[txt2ducky.sh] ${F_BOLD}Rendering $filein...${NO_FORMAT}"
while IFS= read -r line; do
    echo "STRING $line" >> $fileout
    echo "ENTER"  >> $fileout
done < $filein

echo "[txt2ducky.sh] ${F_BOLD}Complete.${NO_FORMAT}"

exit 0