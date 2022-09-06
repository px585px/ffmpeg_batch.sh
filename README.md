# ffmpeg-recursive-bash
A simple bash script to execute ffmpeg recursively on folders and sub-folder

lunch the script without providing a path to use it in the current directory
e.g. `bash ffmpeg-recursive.sh`

or provide a path
e.g. `bash ffmpeg-recursive ~/Vidoes/nature`

###After running the script you will be asked to enter some information like:
- input filetype of the media files that you want to process with ffmpeg 
- output filetype of the media that ffmpeg will be creating
- ffmpeg flags that you may want to use

###the output media will be save in the folder as the input media
