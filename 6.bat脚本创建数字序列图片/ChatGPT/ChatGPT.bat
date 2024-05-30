@echo off
setlocal enabledelayedexpansion

set SIZE=128x128
set BG_COLOR=none

for /l %%i in (1,1,10) do (
    set FILENAME=image_%%i.png
    magick convert -size !SIZE! xc:!BG_COLOR! -fill white -stroke black -strokewidth 2 -gravity center -pointsize 72 -annotate +0+0 %%i !FILENAME!
    echo Image !FILENAME! created.
)

echo All images have been created.
endlocal
