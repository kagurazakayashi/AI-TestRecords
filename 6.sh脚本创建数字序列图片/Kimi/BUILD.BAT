@REM 创建一个批处理脚本（.bat 文件）来使用 ImageMagick 生成具有指定要求的图片，你需要确保你的计算机上已经安装了 ImageMagick，并且 `magick` 命令可以在命令行中使用。

@REM 以下是一个简单的批处理脚本示例，它将生成 10 张 128x128 像素大小的 PNG 图片，每张图片有一个白色的数字，数字周围有黑色的轮廓，背景是透明的：


@echo off
setlocal

:: 设置 ImageMagick 安装路径，如果 ImageMagick 安装在默认路径下，可以不设置此变量
:: set IMAGEMAGICK_PATH=C:\path\to\ImageMagick\

:: 创建一个临时的空白图片
magick convert -size 128x128 xc:none blank.png

:: 循环生成 10 张图片
for /L %%i in (1,1,10) do (
    :: 创建带有数字的图片
    magick convert blank.png -fill white -stroke black -strokewidth 4 -pointsize 48 -gravity center -annotate 0,0 "%%i" -trim +repage output\image_%%i.png
)

:: 清理临时文件
del blank.png

echo Done.
endlocal


@REM 将上述代码保存为 `.bat` 文件，例如 `generate_images.bat`。双击运行这个脚本，它将在当前目录下创建一个名为 `output` 的文件夹（如果不存在的话），并在该文件夹中生成 10 张图片。

@REM 请注意以下几点：
@REM 1. 你可能需要将 `IMAGEMAGICK_PATH` 变量设置为你的 ImageMagick 安装路径，如果 `magick` 命令在你的系统路径中可以直接使用，则可以忽略这一步。
@REM 2. `-strokewidth` 参数设置轮廓的宽度，`-pointsize` 设置字体大小，这些值可能需要根据你的具体需求进行调整。
@REM 3. `-annotate` 命令中的 `0,0` 是文本的起始位置，`%%i` 是循环变量，代表当前的数字。
@REM 4. `-trim +repage` 用于裁剪透明背景并重新分页，确保图片尺寸正确。

@REM 确保在运行脚本之前，你有足够的权限在指定的目录中创建文件和文件夹。
