#!/bin/bash

#take folder name from user and cchange directory to it if it exists
[[ -z $# ]] && dir=$(pwd) || dir=$1
cd $dir || exit
echo $(pwd)

#take some input from the user
read -p "Enter input filetype (leave empty to select all): " iext
read -p "Enter output filetype (required): " oext 
[[ -z $oext ]] && echo "You can't leave it empty"; exit
read -p "Enter ffmpeg flags to use (optinal): " flags

#loop through folders and execute ffmpeg on files whith matching input extention
for file in $(find . -name "*$iext"); do
    echo $file
    echo "${file%.*}"
    $(ffmpeg -i $file $flags ${file%.*}.$oext)
done