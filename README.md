# FFbatch.sh helps you use FFMPEG recursivly 
    
To use the script Enter ./FFbatsh.sh + any ffmpeg flags in your terminal emulator
    
Example: `./FFbatch.sh -s 1920x1080 -sws_flags lanczos -pix_fmt yuv420p -vsync 1`

  the script will then ask you to privide some info:
  
         Specify INPUT folder (Leave empty to select the current folder), e.g. ~/Videos/natue
         Specify OUTPUT folder (Leave empty to save media files in their original location), e.g. ~/Videos/edited
         Specify the INPUT media filetype extension (Leave empty to select all filetypes), e.g. mov
         Specify the OUTPUT media filetype extension (Required), e.g. mp4
         Specify text to append to OUTPUT file name (Leave empty to add nothing), e.g. 'Blue_sky.mp4' will be 'Blue_sky_edited.mp4'
