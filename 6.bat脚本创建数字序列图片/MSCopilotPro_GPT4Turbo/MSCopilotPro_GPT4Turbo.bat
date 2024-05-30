@echo off
setlocal enabledelayedexpansion

set IMAGEMAGICK_PATH="C:\Program Files\ImageMagick-7.1.1-Q16-HDRI\"

for /L %%i in (1,1,10) do (
    %IMAGEMAGICK_PATH%convert -size 128x128 -background transparent -fill white -stroke black -strokewidth 2 -gravity center -font Arial label:%%i output_%%i.png
)

endlocal
