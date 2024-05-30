@echo off
setlocal enabledelayedexpansion

set IMAGEMAGICK_PATH="C:\Program Files\ImageMagick-7.1.1-Q16-HDRI"
set COUNT=1
set WIDTH=128
set HEIGHT=128

if not exist output mkdir output

:loop
if %COUNT% leq 10 (
    echo Generating image %COUNT%
    
    rem 使用ImageMagick生成图片，数字以白色显示并带有黑色轮廓
    %IMAGEMAGICK_PATH%\magick convert -size %WIDTH%x%HEIGHT% xc:none ^
        -gravity center -font Arial -pointsize 72 -fill white -stroke black -strokewidth 2 ^
        -draw "text 0,0 '%COUNT%'" output\image_%COUNT%.png
    
    set /A COUNT+=1
    goto loop
)

echo All images have been generated.
endlocal