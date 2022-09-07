# FFbatch.sh is a simple script to help you use FFMPEG recursivly on media files in folders and sub-folders."
    
    ##Example: bash FFbatch.sh -i ~/Videos -o ~/Videos/Edited -e mov -x mp4 -f '-vn'

    ###Options:
    -i     Specify INPUT folder."
    -o     Specify OUTPUT folder (if not Specified will save media files in thier original location).
    -e     Specify the INPUT media filetype extension.
    -x     Specify the OUTPUT media filetype extension.
    -f     Specify any FFMPEG flags that you may use (they must be between quotes '').
    -h     Print this Help massege.
