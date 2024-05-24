# 以下是遍历当前文件夹下的所有C语言源代码文件，并编译、执行、检查输出的sh脚本：

#!/bin/bash

# 获取当前文件夹下的所有C语言源代码文件
files=$(find . -name "*.c")

for file in $files; do
  # 获取文件名
  filename=${file%.*}

  # 编译C语言源代码文件
  gcc -o $filename $file

  # 如果编译成功
  if [ $? -eq 0 ]; then
    # 执行程序
    ./$filename

    # 检查程序输出是否为"Hello, World!"
    output=$(./$filename)
    if [[ $output != "Hello, World!" ]]; then
      echo "程序 $filename 输出错误：$output"
    fi

    # 添加换行符
    if [[ ! $output =~ $ ]]; then
      echo "" >> $filename
    fi

    # 删除编译的文件
    rm -f $filename
  else
    echo "编译文件 $file 失败"
  fi
done

# 脚本解释：

# #!/bin/bash：指定脚本解释器。
# # 获取当前文件夹下的所有C语言源代码文件：使用find命令获取当前文件夹下的所有C语言源代码文件。
# for file in $files; do：遍历所有C语言源代码文件。
# # 获取文件名：使用%.*截取文件名。
# # 编译C语言源代码文件：使用gcc命令编译C语言源代码文件。
# # 如果编译成功：判断编译是否成功。
# # 执行程序：使用.符号执行程序。
# # 检查程序输出是否为"Hello, World!"：使用[[运算符检查程序输出是否为"Hello, World!"。
# # 添加换行符：如果程序输出没有换行符，则添加换行符。
# # 删除编译的文件：删除编译生成的可执行文件。
# 注意

# 该脚本需要在C语言编译器可用的环境中运行。
# 该脚本会删除编译生成的可执行文件，请确保您不需要这些文件。
# 改进

# 可以添加错误处理机制，例如，当编译或执行程序失败时，可以输出更详细的错误信息。
# 可以添加对其他C语言编译器的支持。
# 可以添加对其他编程语言的支持。
