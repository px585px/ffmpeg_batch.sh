#!/bin/bash

#changing the $IFS variable that determine what the field separators are to not use space
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

#take folder name from user and cchange directory to it if it exists
[[ -z $# ]] && dir=$(pwd) || dir=$1
cd $dir || exit

#take some input from the user
read -p "Enter input filetype (leave empty to select all): " iext
read -p "Enter output filetype (required): " oext 
[[ -z $oext ]] && echo "You can't leave it empty" && exit
read -p "Enter ffmpeg flags to use (optinal): " flags

#loop through folders and execute ffmpeg on files whith matching input extension
for file in $(find . -type f -name "*$iext"); do
    echo $file
    $(ffmpeg -i $file $flags ${file%.*}.$oext)
done

#restoring default $IFS value
IFS=$SAVEIFS
