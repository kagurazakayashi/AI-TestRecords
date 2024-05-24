#!/bin/bash
for file in *.py; do
    echo "正在执行 $file ..."
    python $file test.log
    # 如果目录 2023 存在
    if [ -d "2023" ]; then
        tree 20*
        cat 2023/03/16/19/02.log
        rm -rf 20*
    fi
    if [ -d "logs" ]; then
        tree logs
        cat logs/2023/03/16/19/02.log
        rm -rf logs
    fi
    echo "执行 $file 完成。"
    echo "===================="
done
