@echo off
setlocal

magick convert -size 128x128 xc:none blank.png

for /L %%i in (1,1,10) do (
    magick convert blank.png -fill white -stroke black -strokewidth 4 -pointsize 48 -gravity center -annotate 0,0 "%%i" -trim +repage image_%%i.png
)

del blank.png

echo Done.
endlocal
