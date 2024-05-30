@echo off
set IMAGEMAGICK_PATH="C:\Program Files\ImageMagick-7.1.1-Q16-HDRI\magick.exe"
set FONT_PATH="C:\\Windows\\Fonts\\tahoma.ttf"
set OUTPUT_PATH=%CD%
if not exist "%OUTPUT_PATH%" mkdir "%OUTPUT_PATH%"
for /L %%N in (1,1,10) do (
    %IMAGEMAGICK_PATH% -size 128x128 xc:none -font "%FONT_PATH%" -pointsize 48 -fill white -stroke black -strokewidth 2 -annotate +64+64 '%%N' "%OUTPUT_PATH%\image_%%N.png"
)
echo Done.
