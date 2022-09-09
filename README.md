# FFbatch.sh helps you use FFMPEG recursivly 
    
To use the script Enter ./FFbatsh.sh + any ffmpeg flags in your terminal emulator
    
Example: `./FFbatch.sh -s 1920x1080 -sws_flags lanczos -pix_fmt yuv420p -vsync 1`

  the script will then ask you to privide some info:
  
         Specify INPUT folder (Leave empty to select the current folder).
         Specify OUTPUT folder (Leave empty to save media files in their original location).
         Specify the INPUT media filetype extension (Leave empty to select all filetypes).
         Specify the OUTPUT media filetype extension (Required).
         Specify text to append to OUTPUT file name (Leave empty to add nothing).
