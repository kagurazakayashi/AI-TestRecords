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
            echo "[OK] 输出匹配。"
        else
            echo "[NG] 输出不匹配！"
        fi

        echo "===================="
    else
        echo "编译失败: $file"
    fi
    
    # 删除编译的程序文件
    rm -f "$program"
done
