@echo off

setlocal enabledelayedexpansion

for /L %%i in (1,1,10) do (
    convert -size 128x128 xc:none -fill white -pointsize 64 -draw "stroke black fill none text 64,64 '%%i'" image_%%i.png
)
