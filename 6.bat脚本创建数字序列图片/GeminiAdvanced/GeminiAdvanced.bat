@echo off
setlocal enabledelayedexpansion

set IMAGEMAGICK_PATH="C:\Program Files\ImageMagick-7.1.1-Q16-HDRI"  
set OUTPUT_PATH=%CD%

mkdir %OUTPUT_PATH% 2>nul

for /L %%i in (1, 1, 10) do (
    %IMAGEMAGICK_PATH%\magick convert -size 128x128 xc:transparent -fill white -stroke black -strokewidth 2 -font Arial -pointsize 50 -gravity center label:%%i %OUTPUT_PATH%\image%%i.png
)
