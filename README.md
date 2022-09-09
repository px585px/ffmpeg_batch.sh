# FFbatch.sh helps you use FFMPEG recursivly 
    
To use the script Enter bash FFbatsh.sh + any ffmprg flags that you you may want to use in the terminal
    
Example: `bash FFbatch.sh -s 1920x1080 -sws_flags lanczos -pix_fmt yuv420p -vsync 1`

  the script will then ask you to privide some info:
  
         Specify INPUT folder (if not Specified it will select the current folder).
         Specify OUTPUT folder (if not Specified it will save media files in their original location).
         Specify the INPUT media filetype extension (if not Specified it will select all filetypes).
         Specify the OUTPUT media filetype extension (Required).
