# 编写一个sh脚本，遍历当前文件夹下的所有c语言源代码文件，并将每个文件使用gcc编译为一个独立的程序，如果编译成功，则执行它。如果执行的输出结尾没有换行，则添加换行。并检查程序的输出是否为"Hello, World!"（忽略末尾是否有多余的换行）。最后，删除编译的文件。

#!/bin/bash

# 遍历当前目录下的所有.c文件
for file in *.c; do
    # 检查文件是否存在
    if [ -f "$file" ]; then
        # 使用gcc编译源代码，并生成同名的可执行文件
        gcc -o "${file%.c}" "$file"
        
        # 检查编译是否成功
        if [ $? -eq 0 ]; then
            # 执行程序并将输出存储到变量中
            output=$(./"${file%.c}")
            
            # 添加结尾换行符（如果需要）
            if [[ ! $output =~ $'\n' ]]; then
                output="$output\n"
            fi
            
            # 检查输出是否为"Hello, World!"（忽略末尾换行）
            if [[ $output =~ ^Hello,\sWorld!$ ]]; then
                echo "File '$file' compiled and executed successfully with expected output."
            else
                echo "File '$file' did not produce the expected output: $output"
            fi
        else
            echo "Failed to compile file '$file'"
        fi
        
        # 删除编译生成的可执行文件
        rm "./${file%.c}"
    fi
done

# 这个脚本假设你的gcc编译器在PATH环境变量中，并且所有的C源代码文件都能成功编译并执行，没有外部依赖或其他错误。此外，它也忽略了可能存在的命令行参数或者用户输入等复杂情况。

# 注意：此脚本会删除每一个编译后的可执行文件，如果你希望保留这些文件，请去掉最后一行的rm命令。
