# 下面是一个简单的shell脚本，用于实现你的要求。这个脚本会遍历当前目录下的所有C语言源代码文件（扩展名为.c），使用gcc编译每个文件为一个独立的程序，如果编译成功，则执行它。它还会检查程序的输出是否为"Hello, World!"（忽略末尾是否有多余的换行），并在完成测试后删除编译出的程序文件。

# 请注意，根据你的系统配置和安装的软件版本，可能需要对脚本进行一些调整。

#!/bin/bash

# 遍历当前目录下的所有.c文件
for file in *.c; do
    # 使用文件名（无扩展名）作为编译后的程序名
    program=$(basename "$file" .c)

    # 使用gcc编译C源代码
    gcc "$file" -o "$program"
    
    # 检查编译是否成功
    if [ $? -eq 0 ]; then
        echo "编译成功: $file"
        
        # 执行编译出的程序并捕获输出
        output=$("./$program")
        
        # 检查输出的最后一个字符是否为换行
        last_char=${output: -1}
        if [[ "$last_char" != $'\n' ]]; then
            output="$output"$'\n' # 如果不是，添加换行
        fi
        
        # 输出执行结果
        echo "程序输出: $output"
        
        # 检查输出是否为"Hello, World!"（忽略末尾的换行）
        if [[ "$output" == "Hello, World!"$'\n' ]]; then
            echo "输出匹配: Hello, World!"
        else
            echo "输出不匹配"
        fi
    else
        echo "编译失败: $file"
    fi
    
    # 删除编译的程序文件
    rm -f "$program"
done

# 要使用这个脚本：

# 1. 将上面的脚本保存到一个文件中，例如compile_and_run.sh。
# 2. 通过运行chmod +x compile_and_run.sh命令使脚本可执行。
# 3. 在包含你的C语言源代码文件的目录中运行此脚本。

# 这个脚本很基础，但应该足以满足你的基本需求。根据具体的使用场景，你可能需要对脚本进行适当的修改或扩展。
