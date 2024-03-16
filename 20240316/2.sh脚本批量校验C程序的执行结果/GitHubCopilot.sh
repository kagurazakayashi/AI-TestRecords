# 以下是一个bash脚本，它遍历当前目录下的所有.c文件，使用gcc编译它们，并在成功编译后执行它们。如果输出的最后一个字符不是换行符，它将添加一个。然后，它会检查输出是否为"Hello, World!"，并在最后删除编译的文件。

#!/bin/bash

for file in *.c
do
    # 编译C文件
    gcc "$file" -o "${file%.c}"
    if [ $? -eq 0 ]; then
        # 执行编译的程序并捕获输出
        output=$("./${file%.c}")
        last_char=${output: -1}

        # 如果输出的最后一个字符不是换行符，则添加一个
        if [ "$last_char" != $'\n' ]; then
            output+=$'\n'
        fi

        # 检查输出是否为"Hello, World!"
        if [ "$output" == "Hello, World!\n" ]; then
            echo "${file}: 输出为 'Hello, World!'"
        else
            echo "${file}: 输出不是 'Hello, World!'"
        fi

        # 删除编译的程序
        rm "${file%.c}"
    else
        echo "编译 ${file} 失败"
    fi
done

# 这个脚本假设你的工作目录中的所有.c文件都可以被gcc成功编译。如果有些文件不能被gcc编译，那么这个脚本可能会产生错误。
