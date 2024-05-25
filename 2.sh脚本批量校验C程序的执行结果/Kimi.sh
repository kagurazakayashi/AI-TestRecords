#!/bin/bash
# 下面是一个简单的shell脚本，实现了你的需求。请确保在运行此脚本之前，你已经安装了GCC编译器，并且脚本具有执行权限。

# 遍历当前目录下的所有.c文件
for file in *.c; do
    # 检查文件是否存在
    if [ -f "$file" ]; then
        echo "Compiling $file..."
        
        # 编译文件，生成可执行文件
        gcc -o "${file%.c}" "$file"
        
        # 检查编译是否成功
        if [ $? -eq 0 ]; then
            echo "Executing ${file%.c}..."
            
            # 执行编译后的程序，并捕获输出
            output=$(./"${file%.c}")
            exit_status=$?
            
            # 如果输出结尾没有换行，添加换行
            if [ "${output: -1}" != $'\n' ]; then
                output="${output}\n"
            fi
            
            # 打印输出
            echo -e "$output"
            
            # 检查输出是否为"Hello, World!"（忽略末尾的多余换行）
            if [ "$output" = "Hello, World!" ]; then
                echo "Output is correct."
            else
                echo "Output is incorrect."
            fi
            
            # 删除编译的文件
            rm -f "${file%.c}"
        else
            echo "Compilation failed for $file."
        fi
    fi
done

# 将上述脚本保存为一个文件，例如 `compile_and_run.sh`，然后在终端中运行以下命令来给予执行权限并执行脚本：

# chmod +x compile_and_run.sh
# ./compile_and_run.sh

# 这个脚本会遍历当前目录下所有的 `.c` 文件，使用GCC编译器编译它们，执行编译后的程序，并检查输出是否为"Hello, World!"。如果输出不正确或编译失败，脚本会打印相应的信息。最后，脚本会删除所有编译生成的可执行文件。
