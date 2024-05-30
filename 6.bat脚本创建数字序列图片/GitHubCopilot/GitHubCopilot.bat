@echo off
for /L %%i in (1,1,10) do (
    magick convert -size 128x128 xc:transparent -fill white -stroke black -pointsize 60 -gravity center -annotate 0 %%i image%%i.png
)