#!/bin/bash

#changing the $IFS variable that determine what the field separators are to not use space
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

#help massege
help()
{
    echo
    echo "$(basename $BASH_SOURCE) is a simple script to help you use FFMPEG recursivly on media files in folders and sub-folders."
    echo
    echo -e "\033[33mExample: bash $(basename $BASH_SOURCE) -i ~/Videos -o ~/Videos/Edited -e mov -x mp4 -f '-vn' \033[m"
    echo
    echo "Options:"
    echo "-i     Specify INPUT folder."
    echo "-o     Specify OUTPUT folder (if not Specified will save media files in thier original location)."
    echo "-e     Specify the INPUT media filetype extension."
    echo "-x     Specify the OUTPUT media filetype extension."
    echo "-f     Specify any FFMPEG flags that you may use (they must be between quotes '')."
    echo "-h     Print this Help massege."
    echo
}

#check if ffmpeg is installed on the system
[[ -z $(command -v ffmpeg) ]] && echo -e "\033[48;2;255;0;02m ffmpeg is not installed on your system!\033[m" && exit

#get some arguments from the user
while getopts i:o:e:x:f:h opt; do
    case $opt in
        i) in_dir=$OPTARG ;;
        o) out_dir=$OPTARG ;;
        e) in_ext=$OPTARG ;;
        x) out_ext=$OPTARG ;;
        f) flags=$OPTARG ;;
        h) help; exit ;;
    esac
done
shift $((OPTIND-1))

#check if arguments are correct
if ((OPTIND == 1)); then echo "No options specified, use -h to display help" && exit; fi
[[ ! $in_dir ]] && echo "Please provide an input folder, e.g. -i ~/Videos/nature" && exit
[[ ! $in_ext ]] && echo "Please provide an input file type extension, e.g. -e mov" && exit
[[ ! $out_ext ]] && echo "Please provide an output file type extension, e.g. -x mp4" && exit

#loop through folders and execute ffmpeg on files whith matching input extention
echo -e "\033[36mUsing the following flags: $flags \033[m"

for file in $( find $in_dir -type f -name "*$in_ext" ); do
    echo -e "\033[42m Now Processing: $file\033[m" 
    if [[ -z $out_dir ]] #if no output folder is specified then save at the same folder as input files
        then
        ffmpeg -hide_banner -loglevel error -n -i $file $flags ${file%.*}.$out_ext
    else #if an output folder is specified then save at that folder
        [[ ${out_dir: -1} != / ]] && out_dir=$out_dir/ #check if folder does not end with "/" and if not add it
        ffmpeg -hide_banner -loglevel error -n -i $file $flags $out_dir$(basename $file | sed 's/\(.*\)\..*/\1/').$out_ext
    fi
done

#restoring default $IFS value
IFS=$SAVEIFS
