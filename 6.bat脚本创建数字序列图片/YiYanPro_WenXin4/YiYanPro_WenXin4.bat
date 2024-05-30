@echo off  
setlocal enabledelayedexpansion  
  
set "WIDTH=128"  
set "HEIGHT=128"  
set "FONT=Arial"  
set "FONT_SIZE=48"  
set "OUTLINE_COLOR=black"  
set "TEXT_COLOR=white"  
set "BACKGROUND=none"  
  
for /L %%i in (1,1,10) do (  
    set "FILENAME=image_%%i.png"  
      
    magick convert -size %WIDTH%x%HEIGHT% xc:%BACKGROUND% -font %FONT% -pointsize %FONT_SIZE% -draw "text 0,0 '%%i' fill %TEXT_COLOR% stroke %OUTLINE_COLOR% strokewidth 2" +repage -gravity center -extent %WIDTH%x%HEIGHT% %FILENAME%  
)  
