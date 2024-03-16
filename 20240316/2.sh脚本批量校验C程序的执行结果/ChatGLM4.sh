# 以下是一个基本的shell脚本示例，用于完成您所描述的任务。请注意，此脚本假设您的工作环境是类Unix系统，如Linux或macOS，并且已经安装了GCC编译器。

#!/bin/bash

# 遍历当前目录下所有的C源代码文件
for file in *.c; do
    if [ -f "$file" ]; then
        # 从文件名中提取出不包含扩展名的部分
        base_name=$(basename "$file" .c)
        
        # 使用gcc编译源代码文件
        gcc -o "$base_name" "$file" 2>/dev/null
        compile_status=$?
        
        # 检查编译是否成功
        if [ $compile_status -eq 0 ]; then
            # 执行编译后的程序，并将输出重定向到临时文件
            output=$(./"$base_name" 2>/dev/null)
            exit_status=$?
            
            # 检查程序退出状态
            if [ $exit_status -eq 0 ]; then
                # 检查输出是否以换行符结束，如果不是，则添加一个换行符
                if [ "${output[-1]}" != "$(echo -e '\n')" ]; then
                    output="$output$(echo -e '\n')"
                fi
                
                # 检查输出是否为"Hello, World!"（忽略末尾换行）
                trimmed_output=$(echo "$output" | sed -e '$a\' | sed '$d')
                if [ "$trimmed_output" == "Hello, World!" ]; then
                    echo "Program $base_name produced the correct output."
                else
                    echo "Program $base_name produced incorrect output."
                fi
            else
                echo "Program $base_name exited with an error."
            fi
            
            # 删除编译生成的程序文件
            rm "$base_name"
        else
            echo "Failed to compile $file."
        fi
    fi
done

# 在运行此脚本之前，请确保您已经正确设置了文件权限，使其可执行。您可以通过运行chmod +x script_name.sh命令来设置权限，其中script_name.sh是您保存此脚本的文件名。
# 此脚本包含的错误处理非常基础，仅作为示例。在实际使用中，您可能需要根据具体情况添加更详细的错误处理和日志记录。此外，此脚本不会捕获由程序产生的错误输出，而是仅检查退出状态。如果需要处理错误输出，您可以将2>/dev/null替换为实际的错误处理逻辑。
