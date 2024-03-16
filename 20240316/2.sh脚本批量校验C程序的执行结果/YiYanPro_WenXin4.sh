# 以下是一个简单的bash脚本，该脚本会遍历当前文件夹下的所有C语言源代码文件（假设文件扩展名为.c），并使用gcc编译它们。如果编译成功，脚本将执行编译出的程序，并确保其输出以换行符结尾。然后，脚本会检查程序的输出是否为"Hello, World!"（不区分末尾的换行符）。最后，脚本会删除编译生成的可执行文件。

#!/bin/bash  
  
# 遍历当前文件夹下的所有.c文件  
for file in *.c; do  
    # 使用gcc编译.c文件，生成的可执行文件名为原文件名去掉扩展名  
    gcc -o "${file%.c}" "$file"  
      
    # 检查gcc编译是否成功  
    if [ $? -eq 0 ]; then  
        # 执行编译出的程序，并将其输出保存到output变量中  
        output=$("./${file%.c}" 2>&1)  
          
        # 确保输出以换行符结尾  
        if [[ ! "$output" =~ \n$ ]]; then  
            output+=$'\n'  
        fi  
          
        # 检查程序的输出是否为"Hello, World!"（忽略末尾的换行符）  
        if [ "${output%"$'\n"}" = "Hello, World!" ]; then  
            echo "Program ${file%.c} outputs 'Hello, World!' correctly."  
        else  
            echo "Program ${file%.c} does not output 'Hello, World!' correctly."  
            echo "Actual output:"  
            echo "$output"  
        fi  
    else  
        echo "Compilation of $file failed."  
    fi  
      
    # 删除编译生成的可执行文件  
    rm -f "${file%.c}"  
done

# 注意：这个脚本有一些限制和假设：

# 1. 它假设所有的C源文件都位于当前目录中，并且它们的扩展名为.c。
# 2. 它使用gcc进行编译，这意味着你的系统上必须安装有gcc。
# 3. 它假设编译出的可执行文件与源文件位于同一目录中，并且可执行文件的名称是源文件名去掉.c扩展名。
# 4. 它使用简单的字符串比较来检查输出是否为"Hello, World!"，这可能不适用于所有情况（例如，如果输出包含额外的空格或制表符）。如果你需要更复杂的输出匹配，你可能需要使用正则表达式或其他字符串处理工具。
# 5. 脚本会删除编译生成的可执行文件，即使它们可能仍然有用。如果你希望保留这些文件，可以注释掉删除命令或将其修改为将文件移动到其他目录。
# 6. 脚本没有处理可能由执行程序产生的错误输出。如果你需要处理错误输出，你可能需要修改执行命令和输出捕获部分。
