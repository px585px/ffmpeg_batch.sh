#!/bin/bash

#changing the $IFS variable that determine what the field separators are to not use space
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

#check if ffmpeg is installed on the system
[[ -z $(command -v ffmpeg) ]] && echo -e "\033[48;2;255;0;02m ffmpeg is not installed on your system! \033[m" && exit

##help message
[[ $1 == 'help' ]] && echo "Example usage: $(basename $BASH_SOURCE) -s 1920x1080 -sws_flags lanczos -pix_fmt yuv420p -vsync 1" && exit

#take some input from the user
while read -e -p "[+] Specify INPUT folder (Leave empty = current folder): " in_dir && [[ -n $in_dir ]] && [[ ! -d $in_dir ]]; do
    echo -e "\033[31m[-] Directory $in_dir DOES NOT exists! \033[m"
done
while read -e -p "[+] Specify OUTPUT folder (Leave empty = same as input folder): " out_dir && [[ -n $out_dir ]] && [[ ! -d $out_dir ]]; do
    echo -e "\033[31m[-] Directory $out_dir DOES NOT exists! \033[m"
done
read -e -p "[+] Specify INPUT filetype (leave empty = all filetypes): " in_ext
while read -e -p "[+] Specify OUTPUT filetype (required): " out_ext && [[ -z $out_ext ]]; do
    echo -e "\033[31m[-] Please specify an OUTPUT filetype! \033[m"
done
read -e -p "[+] Specify text to append to OUTPUT file name (Leave empty = add nothing): " txt
[[ -n $txt ]] && txt=_$txt

#loop through folders and execute ffmpeg on files with matching input extention
for file in $( find $in_dir -type f -name "*$in_ext" ); do
    echo -e "\033[42m Now Processing: $file \033[m" 
    echo -e "\033[33m Using the following FFMPEG options: $@ \033[m"
    if [[ -z $out_dir ]] #if no output folder is specified then save at the same folder as input files
        then
        ffmpeg -hide_banner -loglevel error -n -i $file $@ ${file%.*}$txt.$out_ext
    else #if an output folder is specified then save at that folder
        [[ ${out_dir: -1} != / ]] && out_dir=$out_dir/ #check if folder does not end with "/" and if not add it
        ffmpeg -hide_banner -loglevel error -n -i $file $@ $out_dir$(basename $file | sed 's/\(.*\)\..*/\1/')$txt.$out_ext
    fi
done

#restoring default $IFS value
IFS=$SAVEIFS
