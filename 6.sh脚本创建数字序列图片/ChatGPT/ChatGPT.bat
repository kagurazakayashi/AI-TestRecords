@REM 创建这样一个批处理（.bat）脚本，你需要在你的系统上安装ImageMagick。ImageMagick是一个功能强大的图像处理库，它允许你通过命令行创建和修改图片。以下是一个简单的批处理脚本示例，它使用ImageMagick命令生成所需的图片：

@echo off
setlocal enabledelayedexpansion

REM 设置生成的图片尺寸和背景颜色
set SIZE=128x128
set BG_COLOR=none

REM 循环生成10张图片
for /l %%i in (1,1,10) do (
    REM 设置图片文件名
    set FILENAME=image_%%i.png
    REM 使用ImageMagick的convert命令创建图片
    magick convert -size !SIZE! xc:!BG_COLOR! -fill white -stroke black -strokewidth 2 -gravity center -pointsize 72 -annotate +0+0 %%i !FILENAME!
    echo Image !FILENAME! created.
)

echo All images have been created.
endlocal

REM 请确保你已经正确安装了ImageMagick，并且它的命令（如magick）可以在你的命令行环境中被识别。这个脚本做了以下事情：
REM 使用for循环生成从1到10的数字，每个数字生成一张图片。
REM 对于每个数字，使用magick convert命令创建一张128x128像素的PNG图片，具有透明背景（xc:none）和中心位置的白色数字。
REM 数字被添加黑色轮廓，通过设置-stroke black和-strokewidth参数实现。
REM 生成的图片被命名为image_1.png, image_2.png, ..., image_10.png。
REM 在运行这个脚本之前，请替换或确保脚本中的所有命令和参数都符合你当前的环境和需求。如果你想调整图片的大小、背景色、字体颜色或者字体大小，可以修改脚本中对应的参数。