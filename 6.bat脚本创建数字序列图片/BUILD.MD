# 问题

创建一个 bat 脚本，使用 ImageMagick 生成 10 张图片，每张图片大小均为 128x128，PNG格式，图片的内容为透明背景加白色的当前序号数字，数字加以黑色的轮廓。

# 注意事项

- 运行前应保证：
  - 有 `magick` 命令， `choco install imagemagick` 。
  - `bat` 文件行尾采用 `CRLF` 。
- 由于可能会遇到编码问题，所以移除了所有中文注释性内容。
- 如果给出的代码要求 ImageMagick 路径，则统一替换为 `C:\Program Files\ImageMagick-7.1.1-Q16-HDRI\magick.exe` ，不变动周围引号。
- 如果给出的代码要求字体路径，则统一替换为 `C:\\Windows\\Fonts\\tahoma.ttf` ，不变动周围引号。
