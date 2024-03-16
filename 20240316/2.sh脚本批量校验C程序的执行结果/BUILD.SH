#!/bin/bash

# 获得当前脚本的文件名
current_script="$(basename "$0")"

# 遍历当前目录下的所有 .sh 文件
for script in *.sh; do
    # 如果不是当前脚本，则执行
    if [ "$script" != "$current_script" ]; then
        echo "正在执行 $script..."
        ./"$script"
        echo "执行 $script 完成。"
        echo "===================="
    fi
done

rm helloworld.txt
