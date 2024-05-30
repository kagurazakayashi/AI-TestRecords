@echo off
setlocal enabledelayedexpansion

for /L %%i in (1,1,10) do (
    magick -size 128x128 xc:transparent -font Arial -pointsize 32 -fill white -draw "text 40,50 '!number:~0,-1!'" -stroke black -strokewidth 2 -draw "text 40,50 '!number:~0,-1!'" PNG32:output_%%i.png
)
