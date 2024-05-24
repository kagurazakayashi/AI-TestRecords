# 当然可以。下面是一个简单的shell脚本，它会做你要求的操作：

#!/bin/bash

# 遍历当前目录下的所有.c文件
for file in *.c; do
    # 使用gcc编译每个文件，输出文件名为file的basename
    gcc "$file" -o "${file%.c}"

    # 如果编译成功，则执行程序
    if [ $? -eq 0 ]; then
        output=$(./"${file%.c}")

        # 如果输出的最后一个字符不是换行符，则添加换行符
        if [[ "$output" != *$'\n' ]]; then
            output="$output"$'\n'
        fi

        # 检查输出是否为"Hello, World!"
        if [ "$output" == "Hello, World!"$'\n' ]; then
            echo "程序 ${file%.c} 的输出正确: $output"
        else
            echo "程序 ${file%.c} 的输出不正确: $output"
        fi
    else
        echo "程序 ${file%.c} 编译失败"
    fi

    # 删除编译生成的文件
    rm "${file%.c}"
done

# 请确保在运行此脚本之前，你有权限在当前目录下创建和删除文件，并且已经安装了gcc编译器。此脚本会检查每个C语言源代码文件的输出是否为"Hello, World!"，并在每次执行后删除编译出的可执行文件。如果你有任何问题或需要进一步的帮助，请随时告诉我！
