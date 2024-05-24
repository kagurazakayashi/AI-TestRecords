@REM 要创建一个批处理脚本（.bat）来生成10张图片，每张图片大小为128x128像素，PNG格式，包含透明背景以及带有黑色轮廓的白色当前序号数字，你可以按照以下步骤操作：
@REM 安装 ImageMagick：首先，确保你的系统上已经安装了 ImageMagick。你可以从 ImageMagick 官网 下载并安装它。
@REM 创建批处理脚本：创建一个新的文本文件，将其保存为 .bat 扩展名，例如 generate_images.bat。
@REM 编辑批处理脚本：使用文本编辑器打开 .bat 文件，并输入以下命令：


@echo off  
setlocal enabledelayedexpansion  
  
REM 设置图片的基本参数  
set "WIDTH=128"  
set "HEIGHT=128"  
set "FONT=Arial"  
set "FONT_SIZE=48"  
set "OUTLINE_COLOR=black"  
set "TEXT_COLOR=white"  
set "BACKGROUND=none"  
  
REM 循环生成10张图片  
for /L %%i in (1,1,10) do (  
    REM 设置图片的文件名  
    set "FILENAME=image_%%i.png"  
      
    REM 生成图片  
    magick convert -size %WIDTH%x%HEIGHT% xc:%BACKGROUND% -font %FONT% -pointsize %FONT_SIZE% -draw "text 0,0 '%%i' fill %TEXT_COLOR% stroke %OUTLINE_COLOR% strokewidth 2" +repage -gravity center -extent %WIDTH%x%HEIGHT% %FILENAME%  
)  
  
echo 图片生成完成！  
pause


@REM 运行批处理脚本：双击 .bat 文件运行脚本。这将在脚本所在的目录中生成10张图片，每张图片上都有一个带有黑色轮廓的白色数字。
@REM 注意：
@REM 这个脚本使用了 ImageMagick 的 magick 命令。确保你的 ImageMagick 安装包含了这个命令。在某些系统上，可能需要使用 convert 而不是 magick convert，具体取决于你的 ImageMagick 版本和配置。
@REM 你可以根据需要调整字体、字体大小、颜色等参数。确保你的系统上安装了指定的字体。
@REM 如果你的系统上没有 Arial 字体，你可以选择其他可用的字体。同样，你也可以根据需要调整字体大小和其他设置。
